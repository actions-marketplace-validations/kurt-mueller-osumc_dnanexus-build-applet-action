#!/bin/sh -l
set -e

echo "Project id: $1"
echo "Overwrite: $2"
echo "Applet directory: $3"

echo "Logging into dnanexus"
dx login --token $DX_TOKEN --noprojects
echo "Logged into dnanexus"

echo "Changing into applet directory & listing contents"
cd $3
ls -alh

echo "Selecting dnanexus project: $1"
dx select $1
echo "Selected dnanexu project: $1"

echo "Building applet"

if [ "$2" = 'true' ]; then
    APPLET_ID=$(dx build --overwrite)
else
    APPLET_ID=$(dx build)
fi

echo "Built resource: $APPLET_ID"

echo ::set-output name=applet-id::$APPLET_ID