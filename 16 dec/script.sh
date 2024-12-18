read -p "Please enter the name to search: " NAME
if [ -z "$NAME" ]; then
  echo "Name cannot be empty. Please run the script again and provide a valid name."
  exit 1
fi
FOUND=false
while IFS='|' read -r fname lname email mobile country; do
  if [ "$fname" == "fname" ]; then
    continue
  fi
  if [[ "${fname,,}" == "${NAME,,}" || "${lname,,}" == "${NAME,,}" ]]; then
    FOUND=true
        echo "First Name: $fname"
        echo "Last Name: $lname"
        echo "Email: $email"
        echo "Mobile: $mobile"
        echo "Country: $country"
        exit 1
    # break
  fi
done < file.csv
if [ "$FOUND" = false ]; then
  echo "No data found for $NAME."
fi