package main

import "sort"

type RuneSlice []rune

// part of the sort package's interface
func (s RuneSlice) Len() int {
	return len(s)
}

func (s RuneSlice) Less(i, j int) bool {
	return s[i] < s[j]
}

func (s RuneSlice) Swap(i, j int) {
	s[i], s[j] = s[j], s[i]
}

func hash(s string) string {
	r := RuneSlice([]rune(s))

	sort.Sort(r)

	return string(r)
}
