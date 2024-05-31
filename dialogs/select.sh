#!/usr/bin/env bash

PS3="Provide selection: "

select selected in 'one' 'two' 'three'; do
    echo "${REPLY}: ${selected}"
    break
done
