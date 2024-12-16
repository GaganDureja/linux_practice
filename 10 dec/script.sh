file=file.txt
for name in $(cat "$file"); do
  echo "Hi $name"
done