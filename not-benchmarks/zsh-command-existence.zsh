#!/usr/bin/env zsh

N=20000
cmd=ls

echo
echo 'rounds, type, hash, command -v, which, $+commands'
echo 'benchmarking...'
echo

TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S'

echo
echo "type:"
time (repeat $N {type $cmd &>/dev/null})

echo
echo "hash:"
time (repeat $N {hash $cmd &>/dev/null})

echo
echo "command -v:"
time (repeat $N {command -v $cmd &>/dev/null})

echo
echo "which:"
time (repeat $N {which $cmd &>/dev/null})

echo
echo '$+commands:'
time (repeat $N { (( $+commands[$cmd] )) })

