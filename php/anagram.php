#!/usr/bin/env php
<?php

ini_set("memory_limit", "256M");

if (extension_loaded("xdebug")) {
    echo "You've got xdebug running, this really isn't going to be an accurate test";
    exit(1);
}

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
$biggest   = 0;

while (($line = fgets($handle, 1024)) !== false) {
    $word = trim($line);

    $arr = str_split(strtolower($word));
    sort($arr);
    $hash = implode("", $arr);

    if (!isset($container[$hash])) {
        $container[$hash] = [$word];
    } else {
        $container[$hash][] = $word;
        $biggest = ($cap = count($container[$hash])) > $biggest ? $cap : $biggest;
    }
}

if (!feof($handle)) {
    echo "Error: unexpected fgets() fail" . PHP_EOL;
    exit(1);
}

fclose($handle);

printf("The largest number of anagrams is %d" . PHP_EOL, $biggest);

foreach ($container as $list) {
    if (count($list) < $biggest) {
        continue;
    }

    echo "[" . implode(" ", $list) . "]" . PHP_EOL;
}

exit(0);
