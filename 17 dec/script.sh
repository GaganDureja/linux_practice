read -p "Please enter the name to search: " NAME
if [ -z "$NAME" ]; then
  echo "Name cannot be empty. Please run the script again and provide a valid name."
  exit 1
fi
echo "Available data: fname, lname, email, mobile, country"
read -p "Please enter data you want to retrieve: " COLUMN
if [ -z "$COLUMN" ]; then
  echo "Column name cannot be empty. Please run the script again and provide a valid column name."
  exit 1
fi
FOUND=false
while IFS='|' read -r fname lname email mobile country; do
  if [ "$fname" == "fname" ]; then
    continue
  fi
  if [[ "${fname,,}" == "${NAME,,}" || "${lname,,}" == "${NAME,,}" ]]; then
    FOUND=true
    case $COLUMN in
      fname)
        echo "First Name: $fname"
        ;;
      lname)
        echo "Last Name: $lname"
        ;;
      email)
        echo "Email: $email"
        ;;
      mobile)
        echo "Mobile: $mobile"
        ;;
      country)
        echo "Country: $country"
        ;;
      *)
        echo "Invalid column name: $COLUMN. Please run the script again and use a valid column name."
        exit 1
        ;;
    esac
    # break
  fi
done < file.csv
if [ "$FOUND" = false ]; then
  echo "No data found for $NAME."
fi