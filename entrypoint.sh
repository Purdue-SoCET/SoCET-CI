#! /bin/bash -l

echo "Moving fusesoc libs to $GITHUB_WORKSPACE"
mv /fusesoc.conf $GITHUB_WORKSPACE
mv /fusesoc_libraries $GITHUB_WORKSPACE

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
