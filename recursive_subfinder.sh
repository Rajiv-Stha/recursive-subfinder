#!/bin/bash

output_file="subdomains.txt"

echo -n "Domain to enumerate subdomains: "
read domain

subfinder -d "$domain" | tee "$output_file"

while read -r line; do
	subfinder -d $line | tee -a ".$output_file"
done < "$output_file"

# Combining subdomains and, nested ones.
cat ".$output_file" >> "$output_file"

cat "$output_file" | sort -u | uniq > ".$output_file"

mv ".$output_file" $output_file
