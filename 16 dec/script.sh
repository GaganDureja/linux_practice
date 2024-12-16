if [ $# -ne 1 ]; then
  echo "Please provide name to search like $0 name"
  exit 1
fi

NAME=$1
FOUND=false

while IFS='|' read -r fname lname email mobile country; do
  if [ "$fname" == "fname" ]; then
    continue
  fi

  if [ "${fname,,}" == "${NAME,,}" ] || [ "${lname,,}" == "${NAME,,}" ]; then
    echo "Details for $NAME:"
    echo "First Name: $fname"
    echo "Last Name: $lname"
    echo "Email: $email"
    echo "Mobile: $mobile"
    echo "Country: $country"
    FOUND=true
    break
  fi
done < file.csv

if [ "$FOUND" = false ]; then
  echo "No data found for $NAME."
fi