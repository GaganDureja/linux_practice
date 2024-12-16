file=file1.txt
for name in $(cat "$file"); do
  echo "Hi $name"
done

file=file2.txt
for name in $(cat "$file"); do
  echo "Hello $name"
done