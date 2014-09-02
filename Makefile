benchmark: go
	time ./go/anagram ./words
	time php ./php/anagram.php ./words
	time node ./node/anagrams.js ./words

go:
	go build -o go/anagram go/*.go

.PHONY: go benchmark
