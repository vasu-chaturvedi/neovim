-- Neovim → sqlplus runner (TTY/ARCON friendly)
-- Features:
--   - Run selection/buffer/line
--   - TIMING ON, CSV spool
--   - Error highlighting for ORA-/PLS-/SP2-
--   - :SQLExplain  -> EXPLAIN PLAN FOR + DBMS_XPLAN.DISPLAY
--   - :SQLPlanExec -> Execute statement silently and show DBMS_XPLAN.DISPLAY_CURSOR (ALLSTATS LAST)
--   - :SQLDesc     -> sqlplus DESC for word or given name
--   - :SQLOwnerDesc -> Pretty describe via ALL_TAB_COLUMNS (needs data dict access)
--
-- Setup:
--   export ORA_DSN="user/password@host:1521/ORCLPDB1"  (or "@TNSALIAS" / wallet)
--   require("sqlplus_runner").setup({ display = "vsplit" })
--
-- Buffer keymaps (in sql/plsql):
--   <leader>qs  selection
--   <leader>qc  selection → CSV
--   <leader>qb  buffer
--   <leader>ql  line
--   <leader>qe  EXPLAIN (sel/line)
--   <leader>qp  PLAN+EXEC (sel/line; ALLSTATS LAST)
--   <leader>qd  DESC word
--   <leader>qD  OWNER.DESC (prompt)

local M = {}

-- ---------- Config ----------
local ORA_DSN   = vim.env.ORA_DSN or ""    -- prefer env var / wallet / @TNS
local DISPLAY   = "vsplit"                 -- "split" | "vsplit" | "float"
local LINESIZE  = 32767
local PAGESIZE  = 1000
local SERVEROUT = "ON"
local FEEDBACK  = "ON"
local TIMING    = "ON"
local HEADING   = "ON"
local TRIMSPOOL = "ON"
local TAB       = "OFF"
local SQLPROMPT = "SQL>"

local NS = vim.api.nvim_create_namespace("sqlplus_runner")

-- ---------- Helpers ----------
local function sqlplus_cmd()
  local cmd = { "sqlplus", "-s" }
  if ORA_DSN ~= "" then table.insert(cmd, ORA_DSN) end
  return cmd
end

local function open_results_win(title)
  local buf = vim.api.nvim_create_buf(false, true)
  vim.bo[buf].bufhidden = "wipe"
  vim.bo[buf].filetype  = "sql"
  local win
  if DISPLAY == "float" then
    local W = math.floor(vim.o.columns * 0.72)
    local H = math.floor(vim.o.lines   * 0.62)
    win = vim.api.nvim_open_win(buf, true, {
      relative="editor", style="minimal", border="rounded",
      width=W, height=H, col=(vim.o.columns-W)/2, row=(vim.o.lines-H)/2,
    })
  elseif DISPLAY == "vsplit" then
    vim.cmd.vsplit()
    win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_buf(win, buf)
  else
    vim.cmd.split()
    win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_buf(win, buf)
  end
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, { "-- "..title, "" })
  return buf, win
end

local function normalize_sql(text)
  if text:match("%f[%a]BEGIN%f[%A]") or text:lower():match("create%s+or%s+replace") then
    if not text:match("\n/%s*$") then text = text .. "\n/\n" end
  end
  return text
end

local function write_script(lines, csv_spool_path)
  local tmp = vim.fn.tempname() .. ".sql"
  local f = assert(io.open(tmp, "w"))
  local header = ([[SET PAGESIZE %d LINESIZE %d FEEDBACK %s HEADING %s TRIMSPOOL %s TAB %s
SET SERVEROUTPUT %s SIZE UNLIMITED
SET LONG 1000000 LONGCHUNKSIZE 1000000
SET TIMING %s
]]):format(PAGESIZE, LINESIZE, FEEDBACK, HEADING, TRIMSPOOL, TAB, SERVEROUT, TIMING)
  f:write(header)

  if csv_spool_path and #csv_spool_path > 0 then
    f:write([[
SET COLSEP ','
SET UNDERLINE OFF
SET PAGESIZE 0
SET HEADING OFF
SET FEEDBACK OFF
SET ECHO OFF
SPOOL ]]..csv_spool_path..[[

]])
  end

  local text = table.concat(lines, "\n")
  f:write(normalize_sql(text).."\n")

  if csv_spool_path and #csv_spool_path > 0 then
    f:write("SPOOL OFF\n")
  end

  f:write("EXIT\n")
  f:close()
  return tmp
end

local function clean_output(lines)
  local out = {}
  for _, line in ipairs(lines) do
    if line ~= "" and line ~= SQLPROMPT then
      table.insert(out, line)
    end
  end
  if #out == 0 then out = { "(no output)" } end
  return out
end

local function highlight_errors(buf, lines)
  vim.api.nvim_buf_clear_namespace(buf, NS, 0, -1)
  for i, l in ipairs(lines) do
    if l:match("^(ORA%-%d+)") or l:match("^(PLS%-%d+)") or l:match("^(SP2%-%d+)") then
      vim.api.nvim_buf_add_highlight(buf, NS, "DiagnosticError", i-1+2, 0, -1)
      vim.api.nvim_buf_set_extmark(buf, NS, i-1+2, 0, {
        virt_text = { { " ← error", "DiagnosticError" } },
        virt_text_pos = "eol",
      })
    end
  end
end

local function run_sql(title, text, csv_path)
  local buf = open_results_win(title)
  local script = write_script(vim.split(text, "\n", {plain=true}), csv_path)
  local cmd = sqlplus_cmd()
  table.insert(cmd, "@"..script)

  local output = {}
  local jid = vim.fn.jobstart(cmd, {
    stdout_buffered = true,
    stderr_buffered = true,
    on_stdout = function(_, data) if data then for _,l in ipairs(data) do if l ~= "" then table.insert(output, l) end end end end,
    on_stderr = function(_, data) if data then for _,l in ipairs(data) do if l ~= "" then table.insert(output, "!! "..l) end end end end,
    on_exit = function(_, code)
      vim.schedule(function()
        pcall(vim.loop.fs_unlink, script)
        if csv_path and #csv_path > 0 then
          table.insert(output, "")
          table.insert(output, ("CSV spooled to: %s"):format(csv_path))
        end
        local clean = clean_output(output)
        if code ~= 0 then table.insert(clean, 1, ("(sqlplus exit code: %d)"):format(code)) end
        vim.api.nvim_buf_set_lines(buf, -1, -1, false, clean)
        pcall(vim.api.nvim_buf_set_option, buf, "modifiable", false)
        highlight_errors(buf, clean)
      end)
    end,
  })
  if jid <= 0 then
    vim.api.nvim_buf_set_lines(buf, -1, -1, false, { "Failed to start sqlplus." })
  end
end

-- ---------- RUN ----------
function M.exec_selection(csv)
  local m = vim.fn.mode()
  if m ~= "v" and m ~= "V" and m ~= "\22" then
    vim.notify("Visual-select SQL first.", vim.log.levels.WARN); return
  end
  local srow, scol = unpack(vim.api.nvim_buf_get_mark(0, "<"))
  local erow, ecol = unpack(vim.api.nvim_buf_get_mark(0, ">"))
  local lines = vim.api.nvim_buf_get_text(0, srow-1, scol, erow-1, ecol+1, {})
  local csv_path = csv and vim.fn.input("CSV file path: ", vim.fn.expand("~").."/out.csv") or nil
  run_sql("sqlplus: selection", table.concat(lines, "\n"), csv_path)
end

function M.exec_buffer()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  run_sql("sqlplus: buffer", table.concat(lines, "\n"), nil)
end

function M.exec_line()
  local row = (vim.api.nvim_win_get_cursor(0))[1]
  local line = vim.api.nvim_buf_get_lines(0, row-1, row, false)[1] or ""
  run_sql("sqlplus: line", line, nil)
end

-- ---------- EXPLAIN (static) ----------
local function explain_sql(sql_text)
  if sql_text:match("%f[%a]BEGIN%f[%A]") or sql_text:lower():match("create%s+or%s+replace") then
    vim.notify("EXPLAIN PLAN expects a single SQL statement, not a PL/SQL block.", vim.log.levels.WARN)
    return
  end
  local stmt = sql_text:gsub("%s*;%s*$", "")
  local script = ([[
EXPLAIN PLAN FOR
%s;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY(
  NULL, NULL, 'BASIC +PREDICATE +ALIAS +NOTE'
));
]]):format(stmt)
  run_sql("sqlplus: EXPLAIN PLAN", script, nil)
end

function M.explain_selection_or_line()
  local mode = vim.fn.mode()
  if mode == "v" or mode == "V" or mode == "\22" then
    local srow, scol = unpack(vim.api.nvim_buf_get_mark(0, "<"))
    local erow, ecol = unpack(vim.api.nvim_buf_get_mark(0, ">"))
    local lines = vim.api.nvim_buf_get_text(0, srow-1, scol, erow-1, ecol+1, {})
    explain_sql(table.concat(lines, "\n"))
  else
    local row = (vim.api.nvim_win_get_cursor(0))[1]
    local line = vim.api.nvim_buf_get_lines(0, row-1, row, false)[1] or ""
    explain_sql(line)
  end
end

-- ---------- PLAN + EXEC (runtime stats) ----------
local function plan_and_exec_sql(sql_text)
  if sql_text:match("%f[%a]BEGIN%f[%A]") or sql_text:lower():match("create%s+or%s+replace") then
    vim.notify("PLAN+EXEC expects a single SQL statement (not a PL/SQL block).", vim.log.levels.WARN)
    return
  end
  local stmt = sql_text:gsub("%s*;%s*$", "")
  -- Add gather_plan_statistics hint if not present
  local hinted = stmt
  if not stmt:find("/%*%+[^%*]*gather_plan_statistics", 1) then
    hinted = stmt:gsub("^%s*(%u+)", "/*+ gather_plan_statistics */ %1", 1)
  end

  local script = ([[
SET TERMOUT OFF
ALTER SESSION SET statistics_level=ALL;

%s;

SET TERMOUT ON
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR(
  NULL, NULL, 'ALLSTATS LAST +PEEKED_BINDS +ALIAS +NOTE'
));
]]):format(hinted)

  run_sql("sqlplus: PLAN+EXEC (ALLSTATS LAST)", script, nil)
end

function M.planexec_selection_or_line()
  local mode = vim.fn.mode()
  if mode == "v" or mode == "V" or mode == "\22" then
    local srow, scol = unpack(vim.api.nvim_buf_get_mark(0, "<"))
    local erow, ecol = unpack(vim.api.nvim_buf_get_mark(0, ">"))
    local lines = vim.api.nvim_buf_get_text(0, srow-1, scol, erow-1, ecol+1, {})
    plan_and_exec_sql(table.concat(lines, "\n"))
  else
    local row = (vim.api.nvim_win_get_cursor(0))[1]
    local line = vim.api.nvim_buf_get_lines(0, row-1, row, false)[1] or ""
    plan_and_exec_sql(line)
  end
end

-- ---------- DESC (sqlplus) ----------
function M.describe(name)
  name = name or vim.fn.expand("<cword>")
  if not name or name == "" then
    name = vim.fn.input("DESC object (OWNER.OBJ or OBJ): ")
    if name == "" then return end
  end
  run_sql("sqlplus: DESC " .. name, "DESC " .. name, nil)
end

-- ---------- OWNER.DESC (ALL_TAB_COLUMNS pretty) ----------
local function owner_object_from_input(input)
  input = input or ""
  input = input:gsub("^%s+", ""):gsub("%s+$", "")
  if input == "" then
    local owner = vim.fn.input("OWNER: ")
    if owner == "" then return nil end
    local obj   = vim.fn.input("OBJECT (table/view): ")
    if obj == "" then return nil end
    return owner:upper(), obj:upper()
  end
  local dot = input:find("%.")
  if dot then
    return input:sub(1, dot-1):upper(), input:sub(dot+1):upper()
  else
    local owner = vim.fn.input("OWNER for '"..input.."': ")
    if owner == "" then return nil end
    return owner:upper(), input:upper()
  end
end

function M.owner_desc(arg)
  local owner, obj = owner_object_from_input(arg)
  if not owner then return end

  local sql = ([[
COLUMN col_id   FORMAT 9999
COLUMN column_name FORMAT A32
COLUMN data_type    FORMAT A24
COLUMN nullable     FORMAT A3
COLUMN data_default FORMAT A40
COLUMN comments     FORMAT A50

SELECT
  c.column_id                                         AS col_id,
  c.column_name,
  c.data_type ||
    CASE
      WHEN c.data_type IN ('VARCHAR2','CHAR','NVARCHAR2','NCHAR')
        THEN '('||c.char_length||')'
      WHEN c.data_type = 'NUMBER' AND c.data_precision IS NOT NULL
        THEN '('||c.data_precision||NVL2(c.data_scale, ','||c.data_scale, '')||')'
      WHEN c.data_type LIKE 'TIMESTAMP%%' AND c.data_scale IS NOT NULL
        THEN '('||c.data_scale||')'
      ELSE ''
    END                                               AS data_type,
  c.nullable,
  CASE
    WHEN c.data_default IS NULL THEN NULL
    ELSE REGEXP_REPLACE(DBMS_LOB.SUBSTR(TO_LOB(c.data_default), 1000, 1), '[\r\n]+', ' ')
  END                                                 AS data_default,
  com.comments                                        AS comments
FROM all_tab_columns c
LEFT JOIN all_col_comments com
  ON com.owner = c.owner AND com.table_name = c.table_name AND com.column_name = c.column_name
WHERE c.owner = '%s' AND c.table_name = '%s'
ORDER BY c.column_id;

-- Indexes
PROMPT
PROMPT Indexes:
COLUMN index_name FORMAT A40
COLUMN uniqueness FORMAT A10
SELECT index_name, uniqueness
FROM all_indexes
WHERE table_owner = '%s' AND table_name = '%s'
ORDER BY index_name;

]]):format(owner, obj, owner, obj)

  run_sql(("sqlplus: %s.%s (ALL_TAB_COLUMNS)"):format(owner, obj), sql, nil)
end

-- ---------- Setup ----------
function M.setup(opts)
  opts = opts or {}
  if opts.display then DISPLAY = opts.display end

  vim.api.nvim_create_user_command("SQLSel", function() M.exec_selection(false) end, {})
  vim.api.nvim_create_user_command("SQLCsv", function() M.exec_selection(true)  end, { desc = "Run visual selection → CSV" })
  vim.api.nvim_create_user_command("SQLBuf", function() M.exec_buffer() end, {})
  vim.api.nvim_create_user_command("SQLLine", function() M.exec_line() end, {})

  vim.api.nvim_create_user_command("SQLExplain", function() M.explain_selection_or_line() end, { desc = "EXPLAIN PLAN for selection (or current line)" })
  vim.api.nvim_create_user_command("SQLPlanExec", function() M.planexec_selection_or_line() end, { desc = "Execute & show runtime plan (ALLSTATS LAST)" })

  vim.api.nvim_create_user_command("SQLDesc", function(opts) M.describe(opts.args) end, { nargs = "?", complete = "file" })
  vim.api.nvim_create_user_command("SQLOwnerDesc", function(opts) M.owner_desc(opts.args) end, { nargs = "?" })

  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "sql", "plsql" },
    callback = function()
      vim.keymap.set("n", "<leader>qb", M.exec_buffer,   { buffer=true, desc="sqlplus: run buffer" })
      vim.keymap.set("n", "<leader>ql", M.exec_line,     { buffer=true, desc="sqlplus: run line" })
      vim.keymap.set("v", "<leader>qs", function() M.exec_selection(false) end, { buffer=true, desc="sqlplus: run selection" })
      vim.keymap.set("v", "<leader>qc", function() M.exec_selection(true)  end, { buffer=true, desc="sqlplus: selection → CSV" })
      vim.keymap.set("n", "<leader>qe", M.explain_selection_or_line, { buffer=true, desc="sqlplus: EXPLAIN PLAN (sel/line)" })
      vim.keymap.set("n", "<leader>qp", M.planexec_selection_or_line, { buffer=true, desc="sqlplus: PLAN+EXEC (ALLSTATS LAST)" })
      vim.keymap.set("n", "<leader>qd", function() M.describe() end, { buffer=true, desc="sqlplus: DESC object" })
      vim.keymap.set("n", "<leader>qD", function() vim.cmd("SQLOwnerDesc") end, { buffer=true, desc="sqlplus: OWNER.DESC (ALL_TAB_COLUMNS)" })
    end,
  })
end

return M
