#! /bin/bash -l

echo "Starting Tests..."

while IFS='' read -r target
do
  echo "Running target: $target"
  if $target; then
    echo "Target complete: $target"
  else
    echo "Target failed: $target"
    exit 1
  fi
done <<<"$INPUT_TARGETS"

echo "...Tests Complete"
