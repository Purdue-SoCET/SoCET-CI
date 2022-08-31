#! /usr/bin/env bash -l

echo "Starting FuseSoC Tests..."

targets=$INPUT_FUSESOC_COMMAND

for target in $targets
do
  echo "Running target: $target"
  fusesoc run $target
  echo "Target complete: $target"
done

echo "...FuseSoC Tests Complete"
