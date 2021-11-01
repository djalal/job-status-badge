#!/bin/bash
set -e

#api_url="https://pokeapi.co/api/v2/pokemon/${INPUT_POKEMON_ID}"
api_url="https://pokeapi.co/api/v2/pokemon/${INPUT_CLOUDINARY_URL}"
echo $api_url

pokemon_name=$(curl "${api_url}" | jq ".name")
echo $pokemon_name

echo "::set-output name=label::$pokemon_name"