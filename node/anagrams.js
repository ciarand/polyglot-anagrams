var fs        = require('fs'),
    readline  = require('readline'),
    argv      = process.argv,
    exit      = process.exit,
    container = { anagram: [], biggest: ""},
    hash_word,
    biggest,
    group,
    rd;

group = function (hash) {
    return container.anagram[hash];
};

biggest = function () {
    return group(container.biggest) || "";
};

hash_word = function (word) {
    return word.split("").sort().join("");
};

if (argv.length < 3) {
    console.log("You need to provide a file to use as the words list");
    exit(1);
}

rd = readline.createInterface({
    input: fs.createReadStream(argv[argv.length - 1]),
    output: process.stdout,
    terminal: false
});

rd.on('line', function (line) {
    var word = line.trim(),
        hash = hash_word(word.toLowerCase());

    container.anagram[hash] = group(hash) || [];
    container.anagram[hash].push(word);

    if (group(hash).length > biggest().length) {
        container.biggest = hash;
    }
});

rd.on("close", function () {
    console.log("The largest number of anagrams is", biggest().length);

    for (var key in container.anagram) {
        if (container.anagram[key].length < biggest().length) {
            continue;
        }

        console.log("[" + container.anagram[key].join(" ") + "]");
    }
});
