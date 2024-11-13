#!/usr/bin/env bash

text_bold="$(tput bold)"
text_blue="$(tput setaf 6)"
text_reset="$(tput sgr0)"

wheater_api_url=https://api.openweathermap.org/data/2.5/weather
coords_api_url=http://api.openweathermap.org/geo/1.0/direct

if [ -z "$1" ]; then
    echo -n "Provide city to check weather: "
    printf "\n"
    read -r city
else
    city="$1"
fi
declare -r CITY="${city}"

coords_response="$(curl -s ${coords_api_url} -G --data-urlencode "q=${CITY}" -G --data-urlencode "appid=${WEATHER_API_KEY}" | jq)"

# For debug only
# coords_response='[{"lat": 49.822118,"lon": 19.0448936}]'
# echo "${coords_response}" | jq
lat="$(echo "${coords_response}" | jq '.[0].lat')"
lon="$(echo "${coords_response}" | jq '.[0].lon')"

wheater_response="$(curl -s ${wheater_api_url} \
    -G --data-urlencode "lat=${lat}" \
    -G --data-urlencode "lon=${lon}" \
    -G --data-urlencode "units=metric" \
    -G --data-urlencode "appid=${WEATHER_API_KEY}")"

# For debug only
# echo "${wheater_response}" | jq

temp="$(echo "${wheater_response}" | jq '.main.temp')"
temp_far="$(echo "scale=2; (${temp} * 1.8) + 32" | bc)"
pressure="$(echo "${wheater_response}" | jq '.main.pressure')"
wind="$(echo "scale=2; $(echo "${wheater_response}" | jq '.wind.speed')"*10 | bc)"
clouds="$(echo "${wheater_response}" | jq '.clouds.all')"

echo "${text_blue}Temp C:${text_reset}     ${text_bold}${temp}${text_reset} C"
echo "${text_blue}Temp F:${text_reset}     ${text_bold}${temp_far}${text_reset} F"
echo "${text_blue}Wind  :${text_reset}     ${text_bold}${wind}${text_reset} km/h"
echo "${text_blue}Press :${text_reset}     ${text_bold}${pressure}${text_reset} hPa"
echo "${text_blue}Cloud :${text_reset}     ${text_bold}${clouds}${text_reset}"
