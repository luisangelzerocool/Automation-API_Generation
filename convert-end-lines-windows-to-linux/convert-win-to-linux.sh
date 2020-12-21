#!/bin/bash

find . -type f -print0 | xargs -0 sed -i 's/\x0D$//' #convert recursively files into folders and subfolders
