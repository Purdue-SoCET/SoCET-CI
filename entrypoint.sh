#! /bin/bash -l

echo "Moving fusesoc libs to $GITHUB_WORKSPACE"
mv /fusesoc.conf $GITHUB_WORKSPACE
mv /fusesoc_libraries $GITHUB_WORKSPACE

# debug
ls -ltra /*

ls -ltra /opt/riscv/*

export PATH=$PATH:/opt/riscv/bin

alias riscv64-unknown-elf-gcc='riscv64-unknown-linux-gnu-gcc'
alias riscv64-unknown-elf-objdump='riscv64-unknown-linux-gnu-objdump'
alias riscv64-unknown-elf-objcopy='riscv64-unknown-linux-gnu-objcopy'

alias

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
