package main

import (
	"errors"
	"fmt"

	"github.com/Jemmic/go-pcre2"
)

func extractFromText(text string, index []int) (string, error) {
	if index == nil || len(index) != 2 {
		return "", errors.New("index must be a non-nil slice of length 2")
	}

	if index[0] < 0 || index[1] > len(text) || index[0] > index[1] {
		return "", errors.New("invalid index range")
	}

	extracted := text[index[0]:index[1]]
	return extracted, nil
}

func main() {
	regexp := pcre2.MustCompile(rule, 0)
	result, err := extractFromText(text, regexp.FindIndex([]byte(text), 0))
	if err == nil {
		fmt.Printf("Matched: %s\n", result)
	} else {
		fmt.Println("No match found")
	}
}
