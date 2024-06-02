#!/usr/bin/env bash

grep -Flri 'romeo' .

echo "Email find hello world@example.com" | grep -E '[^[:space:]@]+@[^@[:space:]]+'

grep ' ... ' shakespeare.txt

echo "helllo world" | grep -i 'hel*o'

echo "hello@example.com cosik innego" | grep -i '^.*@.*\..* '
echo "aaa hello@example.com aaaa" | grep -o '[a-z]*@[a-z]*\.[a-z]*'
echo "aaa heLLo@example.com aaaa" | grep -o '[a-zA-Z]*@[a-zA-Z]*\.[a-zA-Z]*'
echo "aaa heLLo@example.com aaaa" | grep -o '[[:alnum:]]*@[[:alnum:]]*\.[[:alnum:]]*'

echo {a..f}{1..9} | grep -o '[^ab]*'

grep '[[:lower:][:alnum:]]*' shakespeare.txt

# ERE
echo "c++ hello cpp" | grep -E '[cC](pp)*(\+\+)*'
echo "My favorite color is red, your favorite colour is green" | grep -E 'colou?r'
echo "My favorite color is red, your favorite colour is green" | grep -E 'colo([uU])?r'
ip addr show | grep -o -E '(([0-9]{1,3})\.){3}[0-9]{1,3}'
ip addr show | grep -o -E '(([0-9]{1,3})\.?){4}/24'
ip addr show | grep -o -E '(([0-9]{1,3})\.?){4}/[0-9]{2}'

# Boundaries

grep -E '\<[a-zA-Z]{14}\>' shakespeare.txt

# PCRE

echo "hello worlds 123" | grep -P '\d'
# positive lookahead
echo "I have 5 apples and 3 oranges" | grep -P '\d+(?= apples)'
# negative lookahead
echo "I have 5 apples and 3 oranges" | grep -oP '\d+(?! apples)'
# positive lookbehind
echo "I have 5 apples and 3 oranges" | grep -oP '(?<=have )\d+'
# negative lookbehind
echo "I have 5 apples and 3 oranges" | grep -oP '(?<!have )\d+'

#Answers
grep -o -E ' \<[2][0]{2}\> ' access.log | wc -l
# 7946
grep -o -E 'GET\s/.*zip' access.log | wc -l
# 4081
grep -o -E '(([0-9a-f]{4}:){7}[0-9a-f]{4}|([0-9]{1,3}\.){3}.[0-9]{1,3})' access.log | sort | uniq -c | sort | tail -10
# ipv4 ipv6 adresses
grep -E '^[0-9a-z\.:]+' access.log | wc -l
# 1 ffcd:e265:467b:c4be:6c11:6653:7ff3:9ce1
# 161 21.11.3.663
# 170 92.0.902.73
# 193 21.9.0.1044
# 306 93.0.961.47
grep -E 'Firefox' access.log | grep -o -E '\<http.*" ' | sort | uniq -c | sort | tail -4
#  29 https://www.virtual-escapades.com/immersive-experiences.html"

# grep -o -E '([0-9]{1,3}\.){3}.[0-9]{1,3}' access.log
# grep -o -E '([0-9a-f]{4}:){7}[0-9a-f]{4}' access.log
