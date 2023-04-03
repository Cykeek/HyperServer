#!/bin/bash

token="e6374f0543c4a29ea37d32fa9e40c57b5ab5a1aa"

echo ""
echo "Enter the pling download link: "

echo ""
read content
echo ""

echo $content > temp.txt
base64 temp.txt > enctemp.txt && tr -d '\n' < enctemp.txt > output.txt
sed -i 's|aHR0|https://dl.hyper-labs.tech/?q=aHR0|g' output.txt
cat output.txt
echo ""

rm temp.txt enctemp.txt output.txt
