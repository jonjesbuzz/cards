#!/bin/sh

# Run and test all of the libraries.

print_header() {
    printf "========== [cards] ${1} ==========\n\n"
}

if [[ -d c ]]; then
    print_header "C"
    cd c
    make clean
    make
    ./cards
    make clean
    cd ..
fi

if [[ -d cpp ]]; then
    print_header "C++"
    cd cpp
    make clean
    make
    ./cards
    make clean
    cd ..
fi

if [[ -d java ]]; then
    print_header "Java"
    cd java
    ./gradlew clean
    ./gradlew test
    ./gradlew clean
    cd ..
fi

if [[ -d nodejs ]]; then
    print_header "Node.js"
    cd nodejs
    npm install
    npm -g install mocha
    npm test
    cd ..
fi

if [[ -d objc && $OSTYPE == "darwin"* ]]; then
    print_header "Objective-C"
    cd objc
    xcodebuild -project Cards.xcodeproj -scheme Cards build
    xcodebuild -project Cards.xcodeproj -scheme Cards test
    xcodebuild -project Cards.xcodeproj -scheme Cards clean
    cd ..
fi

if [[ -d python ]]; then
    print_header "Python"
    cd python
    python3 cards.py
    cd ..
fi

if [[ -d rust ]]; then
    print_header "Rust"
    cd rust
    cargo build
    cargo clean
    cd ..
fi

if [[ -d swift ]]; then
    print_header "Swift"
    cd swift
    swift package clean
    swift_exec=`swift build  | sed -n 3p | cut -d ' ' -f 2`
    eval ${swift_exec}
    swift package clean
    cd ..
fi

print_header "Completed"