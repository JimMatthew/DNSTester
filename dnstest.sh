#!/usr/bin/env bash
DNSRESOLVERS="
8.8.8.8
1.1.1.1
75.75.75.75
192.168.1.1
192.168.1.253
"
DOMAINS="
google.com
facebook.com
ford.com
pepsi.com
instragram.com
lexus.com
pizzahut.com
dell.com
reddit.com
corsair.com
cisco.com
newegg.com
"

printf "%-15s" "Domains"
for x in $DNSRESOLVERS; do
        printf "%14s" "$x"
done
printf "\n"

for d in $DOMAINS; do
        #row=$d
        printf "%-15s" "$d"
        for r in $DNSRESOLVERS; do
                tim=`dig $d @$r |  grep "Query time:" | cut -d " " -f 4`
                printf "%14s" "$tim ms"
        done
        printf "\n"
done
