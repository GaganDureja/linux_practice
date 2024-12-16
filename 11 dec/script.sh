file="file.txt"
for name in $(cat "$file"); do
  if [ "$name" = "Gagan" ]; then
    echo "Hello Gagan"
  else
    echo "Hi $name"
  fi
done