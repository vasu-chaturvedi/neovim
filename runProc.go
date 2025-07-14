package main

import (
	"context"
	"database/sql"
	"fmt"
	"log"
	"runtime"
	"sync"
	"time"
)

func runProceduresForSol(ctx context.Context, db *sql.DB, solID string, procConfig *ExtractionConfig, logCh chan<- ProcLog, mu *sync.Mutex, summary map[string]ProcSummary) {
	var wg sync.WaitGroup
	procCh := make(chan string)

	numWorkers := runtime.NumCPU() * 2
	for i := 0; i < numWorkers; i++ {
		wg.Add(1)
		go func() {
			defer wg.Done()
			for proc := range procCh {
				start := time.Now()
				log.Printf("🔁 Inserting: %s.%s for SOL %s", procConfig.PackageName, proc, solID)
				err := callProcedure(ctx, db, procConfig.PackageName, proc, solID)
				end := time.Now()

				plog := ProcLog{
					SolID:         solID,
					Procedure:     proc,
					StartTime:     start,
					EndTime:       end,
					ExecutionTime: end.Sub(start),
				}
				if err != nil {
					plog.Status = "FAIL"
					plog.ErrorDetails = err.Error()
				} else {
					plog.Status = "SUCCESS"
				}
				logCh <- plog

				mu.Lock()
				s, exists := summary[proc]
				if !exists {
					s = ProcSummary{Procedure: proc, StartTime: start, EndTime: end, Status: plog.Status}
				} else {
					if start.Before(s.StartTime) {
						s.StartTime = start
					}
					if end.After(s.EndTime) {
						s.EndTime = end
					}
					if s.Status != "FAIL" && plog.Status == "FAIL" {
						s.Status = "FAIL"
					}
				}
				summary[proc] = s
				mu.Unlock()
			}
		}()
	}

	for _, proc := range procConfig.Procedures {
		procCh <- proc
	}
	close(procCh)
	wg.Wait()
}

func callProcedure(ctx context.Context, db *sql.DB, pkgName, procName, solID string) error {
	query := fmt.Sprintf("BEGIN %s.%s(:1); END;", pkgName, procName)
	start := time.Now()
	_, err := db.ExecContext(ctx, query, solID)
	log.Printf("✅ Finished: %s.%s for SOL %s in %s", pkgName, procName, solID, time.Since(start).Round(time.Millisecond))
	return err
}
