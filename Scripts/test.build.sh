#!/bin/bash

cd "$(dirname "$0")"
cd ..

WORKSPACE="./Example/WindowAnimationApp.xcworkspace"
SCEHEME="WindowAnimationApp"

function test_build() {
    DESTINATION=$1
    echo "[*] test build for $DESTINATION"
    xcodebuild \
        -workspace "$WORKSPACE" \
        -scheme "$SCEHEME" \
        -destination "$DESTINATION" \
        CODE_SIGN_IDENTITY="" \
        CODE_SIGNING_ALLOWED=NO \
        | xcbeautify
    EXIT_CODE=${PIPESTATUS[0]}
    echo "[*] finished with exit code $EXIT_CODE"
    if [ $EXIT_CODE -ne 0 ]; then
        echo "[!] failed to build for $DESTINATION"
        exit 1
    fi
}

test_build "generic/platform=macOS"

echo "[*] all builds succeeded"
