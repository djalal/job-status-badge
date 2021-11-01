#!/bin/bash
set -e

echo CLOUDINARY_URL=$INPUT_CLOUDINARY_URL
echo LEFT_TEXT=$INPUT_LEFT_TEXT
echo RIGHT_TEXT=$INPUT_RIGHT_TEXT
echo COLOR=$INPUT_COLOR
echo PUBLIC_ID=$INPUT_PUBLIC_ID

BADGE_URI=${LEFT_TEXT}-${RIGHT_TEXT}-${COLOR}

cloudinary config
cloudinary uploader upload https://img.shields.io/badge/$BADGE_URI public_id=$PUBLIC_ID resource_type=image > result.json

OUTPUT_PUBLIC_ID=`cat result.json  | jq ".public_id"`
OUTPUT_SECURE_URL=`cat result.json  | jq ".secure_url"`
OUTPUT_BYTES=`cat result.json  | jq ".bytes"`

echo "::set-output name=public_id::$OUTPUT_PUBLIC_ID"
echo "::set-output name=secure_url::$OUTPUT_SECURE_URL"
echo "::set-output name=bytes::$OUTPUT_BYTES"
