#!/bin/bash

npm install
npx react-native link
cd ios && pod install && cd ..
npx react-native link