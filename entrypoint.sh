#!/bin/bash
set -e

echo --- DEBUG START --------------------------
echo CLOUDINARY_URL=$INPUT_CLOUDINARY_URL
echo LEFT_TEXT=$INPUT_LEFT_TEXT
echo RIGHT_TEXT=$INPUT_RIGHT_TEXT
echo COLOR=$INPUT_COLOR
echo PUBLIC_ID=$INPUT_PUBLIC_ID
echo --- DEBUG END --------------------------

BADGE_URI=${INPUT_LEFT_TEXT}-${INPUT_RIGHT_TEXT}-${INPUT_COLOR}

export CLOUDINARY_URL=$INPUT_CLOUDINARY_URL

cloudinary config
cloudinary uploader upload https://img.shields.io/badge/$BADGE_URI public_id=$INPUT_PUBLIC_ID resource_type=image invalidate=true > result.json

echo --- DEBUG OUTPUT --------------------------
cat result.json

OUTPUT_PUBLIC_ID=`cat result.json  | jq ".public_id"`
OUTPUT_SECURE_URL=`cat result.json  | jq ".secure_url"`
OUTPUT_BYTES=`cat result.json  | jq ".bytes"`

echo "::set-output name=public_id::$OUTPUT_PUBLIC_ID"
echo "::set-output name=secure_url::$OUTPUT_SECURE_URL"
echo "::set-output name=bytes::$OUTPUT_BYTES"
