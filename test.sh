IN="test with spaces;test2 with spaces"

# for target in $targets
# do
#   echo "Running target: $target"
# done

IFS=';' read -ra targets <<< "$IN"
for target in "${targets[@]}"; do
  echo "Running target: $target"
done