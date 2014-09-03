package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"strings"
	"time"
)

func main() {
	start := time.Now()

	words := getWordsFromFile(getFileFromArgs())

	c := newContainer(len(words))
	for _, w := range words {
		if len(w) == 0 {
			continue
		}

		c.addWord(w)
	}

	// print the summary
	fmt.Println("The largest number of anagrams is", c.lengthOfBiggestGroup())

	for _, w := range c.anagrams {
		if len(w) == c.lengthOfBiggestGroup() {
			fmt.Println(w)
		}
	}

	total := time.Since(start)

	fmt.Printf("took %s\n", total.String())
}

func getFileFromArgs() string {
	if len(os.Args) < 2 {
		exitWithError(fmt.Errorf("You need to provide a file to use as the words list"))
	}

	return os.Args[len(os.Args)-1]
}

func getWordsFromFile(path string) []string {
	data, err := ioutil.ReadFile(path)

	if err != nil {
		exitWithError(err)
	}

	return strings.Split(string(data[:]), "\n")
}

func exitWithError(err error) {
	fmt.Println(err)
	os.Exit(1)
}
