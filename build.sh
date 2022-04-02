#!/bin/bash

sitegen
rm -rf public
mkdir public
cp -r www/* public/
rm -rf www
cp styles.css public/styles.css