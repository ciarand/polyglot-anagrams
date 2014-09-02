<?php

ini_set("memory_limit", "256M");

if (count($argv) < 2) {
    echo "You need to provide a file to use as the words list" . PHP_EOL;
    exit(1);
}

$handle = @fopen($argv[count($argv) - 1], "r");
if ($handle === false) {
    echo "Error opening file" . PHP_EOL;
    exit(1);
}

$container = [];
$biggest   = "";

while (($line = fgets($handle, 4096)) !== false) {
    $word = trim($line);

    $hash = hash_word(strtolower($word));
    if (!isset($container[$hash])) {
        $container[$hash] = [];
    }

    $container[$hash][] = $word;

    if (!isset($container[$biggest]) || count($container[$biggest]) < count($container[$hash])) {
        $biggest = $hash;
    }
}

if (!feof($handle)) {
    echo "Error: unexpected fgets() fail" . PHP_EOL;
    exit(1);
}

fclose($handle);

printf("The largest number of anagrams is %d" . PHP_EOL, count($container[$biggest]));

$biglist = $container[$biggest];
$bigcount = count($biglist);

foreach ($container as $list) {
    if (count($list) < $bigcount) {
        continue;
    }

    echo "[" . implode(" ", $list) . "]" . PHP_EOL;
}

exit(0);

function hash_word($str) {
    $arr = str_split($str);

    sort($arr);

    return implode("", $arr);
}
