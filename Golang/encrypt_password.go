package main

import (
	"crypto/aes"
	"crypto/cipher"
	"crypto/rand"
	"encoding/base64"
	"fmt"
	"io"
	"io/ioutil"
	"os"
)

func EncryptGCM(plaintext, key []byte) (string, error) {
	block, err := aes.NewCipher(key)
	if err != nil {
		return "", err
	}
	aesGCM, err := cipher.NewGCM(block)
	if err != nil {
		return "", err
	}
	nonce := make([]byte, aesGCM.NonceSize())
	if _, err := io.ReadFull(rand.Reader, nonce); err != nil {
		return "", err
	}
	ciphertext := aesGCM.Seal(nonce, nonce, plaintext, nil)
	return base64.StdEncoding.EncodeToString(ciphertext), nil
}

func main() {
	if len(os.Args) != 3 {
		fmt.Printf("Usage: %s <password-to-encrypt> <aes-key-file>\n", os.Args[0])
		os.Exit(1)
	}

	password := os.Args[1]
	keyFile := os.Args[2]

	key, err := ioutil.ReadFile(keyFile)
	if err != nil {
		fmt.Printf("Error reading AES key file: %v\n", err)
		os.Exit(1)
	}

	encrypted, err := EncryptGCM([]byte(password), key)
	if err != nil {
		fmt.Printf("Encryption error: %v\n", err)
		os.Exit(1)
	}

	fmt.Println(encrypted)
}
