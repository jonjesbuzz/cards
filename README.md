# cards
![](https://travis-ci.org/jonjesbuzz/cards.svg?branch=master)


A boring card library, written (initially) in C.  Now comes in Swift, C++, Rust, Java, Objective-C, NodeJS, and Python.

## Why?
Because I was bored.

## What does it do?
It's a set of playing cards.  You can build a game out of it.

## Is it tested?
Hahahahahahaha

## Can I make changes?
Sure, make a pull request.  Add new languages.  It'll be fun.

## Why is it boring?
Because, it's not that interesting.

## Really?
Yeah.

## Requirements?
* C: Not much, just a C compiler that supports C11.
* C++: I use clang++.  You can use any compiler you want that supports C++11, I guess.
* Swift: Swift 4.1 compiler on macOS or Linux.
* Rust: The Rust compiler
* Java: Gradle, Java 8 JDK or newer
* Objective-C: Xcode 9.3.1, builds for iOS, macOS, watchOS, and tvOS.
* NodeJS: NodeJS v10.3
* Python: Python 3.6

## How do I build it?
For C / C++:

    cd c
    make

For Swift:

    cd swift
    swift build

For Rust:

    cd rust
    cargo build

For Java:

    ./gradlew build
    ./gradlew jar

For Objective-C:

    xcodebuild -project Cards.xcodeproj -scheme Cards build
    xcodebuild -project Cards.xcodeproj -scheme Cards test

For NodeJS:

    npm install -g mocha
    npm install
    npm test

For Python: nobody builds Python.

## License?
MIT, because you can do whatever you want.
