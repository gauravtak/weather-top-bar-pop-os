#!/bin/bash
location=$(curl -s https://ipinfo.io/json)
city=$(echo "$location" | jq -r '.city')
url="http://api.openweathermap.org/data/2.5/weather?APPID=<YOUR_API_KEY>&q="$city"&units=metric"
res=$(curl -s "$url")

read temp name <<< $(echo "$res" | jq -r '"\(.main.temp) \(.name)"')

echo "$name | $temp°C"
