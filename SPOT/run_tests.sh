#!/bin/bash

xcodebuild test -project SPOT.xcodeproj -scheme SPOT -sdk iphonesimulator -destination "platform=iOS Simulator,OS=latest,name=iPhone 15"
