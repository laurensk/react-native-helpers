#!/bin/bash

run_script()
{
    # Reinstall node_modules
    rm -rf node_modules
    npm install
    npm install --save-dev jetifier
    npx react-native link

    # Reinstall CocoaPods
    npx react-native link
    cd ios && rm -rf pods && cd ..
    cd ios && pod install && cd ..
    npx react-native link

    # Clear android/
    rm -rf android/.idea
    npx jetify

    # Clear caches and start Metro Bundler
    npm start --reset-cache
}

print_screen()
{
    clear
    echo ""
    echo "WELCOME TO JESUS-CHRISTUS FOR REACT-NATIVE"
    echo "I will fix your React-Native app in case nothing is working anymore!"
    echo ""
    echo "Warning: Please commit to git first. Just in case..."
    echo "Warning: Please close Xcode, Android Studio and any running instances of Metro Bundler."
    echo ""
}

exit_script()
{
    clear
    echo ""
    echo "As the Father has loved me, so have I loved you."
    echo ""
    echo ""
}

while true; do
    print_screen
    read -p "Ready? (y/n) " yn
    case $yn in
        [Yy]* ) run_script; break;;
        [Nn]* ) exit_script; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done