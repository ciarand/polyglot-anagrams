benchmark: go objc
	time ./go/anagram ./words
	time php ./php/anagram.php ./words
	time node ./node/anagrams.js ./words
	time ./objc/artifacts/anagrams/Build/Products/Release/anagrams ./words

go:
	go build -o go/anagram go/*.go

objc:
	cd objc && xctool

.PHONY: go benchmark objc
