#! /bin/bash -l

echo "Moving fusesoc libs to $GITHUB_WORKSPACE"
mv /work/fusesoc.conf $GITHUB_WORKSPACE
mv /work/fusesoc_libraries $GITHUB_WORKSPACE

# making symbolic links
ln -s /opt/riscv/bin/riscv64-unknown-linux-gnu-gcc $GITHUB_WORKSPACE/riscv64-unknown-elf-gcc
ln -s /opt/riscv/bin/riscv64-unknown-linux-gnu-objdump $GITHUB_WORKSPACE/riscv64-unknown-elf-objdump
ln -s /opt/riscv/bin/riscv64-unknown-linux-gnu-objcopy $GITHUB_WORKSPACE/riscv64-unknown-elf-objcopy

# debug
ls $GITHUB_WORKSPACE

# putting workspace on path
# a REAL hack, but this works I believe
export PATH=$PATH:/opt/riscv/bin:$GITHUB_WORKSPACE

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
