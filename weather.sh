#!/bin/bash
location=$(curl -s https://ipinfo.io/json)
city=$(echo "$location" | jq -r '.city')

if [ "$city" = "null" ]; then
  city="Jaipur"
fi

url="http://api.openweathermap.org/data/2.5/weather?APPID=8cb0265b0c05c7588727a29517bf0806&q="$city"&units=metric"
res=$(curl -s "$url")

read temp name <<< $(echo "$res" | jq -r '"\(.main.temp) \(.name)"')


echo "$name | $temp°C"
