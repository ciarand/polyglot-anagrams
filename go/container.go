package main

import "strings"

type container struct {
	anagrams map[string][]string
	biggest  string
}

func newContainer(l int) *container {
	return &container{
		anagrams: make(map[string][]string, l),
	}
}

func (c *container) append(word string) {
	h := hash(strings.ToLower(word))

	c.anagrams[h] = append(c.anagrams[h], word)

	if len(c.anagrams[c.biggest]) < len(c.anagrams[h]) {
		c.biggest = h
	}
}

func (c *container) biggestGroup() []string {
	return c.anagrams[c.biggest]
}

func (c *container) lengthOfBiggestGroup() int {
	return len(c.biggestGroup())
}
