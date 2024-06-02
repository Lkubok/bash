#!/usr/bin/env bash

shopt -s autocd
shopt -s cdspell
shopt -s globstar
echo **/*.txt
# include hidden files in globbing
shopt -d dotglob
# fail
shopt -s failglob
#
# nocase
shopt -s nocaseglob
# Extended globbing
shopt -s extglob
echo config-!(-1|-2)
echo config-@(-1|-2)
echo config-+(-1|-2)
echo config-+?(-1|-2)

#
# Grouping
# bash { read line1 read line2 } <file.txt§
# { echo; echo }
# (echo; echo)

# history
# history -d
# export HISTIGNORE
# HISTCONTROL

# History expansion
# !10
# !!
# !1
# !-10
# !?cl?
# ^file.txt^config.txt

# trap command
