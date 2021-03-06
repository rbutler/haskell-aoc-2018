#!/bin/bash

export TYPE=EXE

for d in {1..4}
do
  export DAY=0${d}
  for p in {1..2}
  do
    export PART=${p}
    export LANG=HASKELL && ./bin/run.sh 2>&1
    export LANG=ETA && ./bin/run.sh 2>&1
  done
done
