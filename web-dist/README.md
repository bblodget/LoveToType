# Web Distribution Files

This directory contains files needed to run the LÖVE game in a web browser using love.js.

## Source
These files were originally copied from the [love.js repository](https://github.com/Davidobot/love.js), which provides a way to run LÖVE games in a web browser using Emscripten.

## Modifications
The following modifications were made to the original files:
- Removed the `<base href="/play/">` tag from index.html to fix path issues
- Other necessary adjustments to make the game work properly in a browser

## Generated Files
The following files are generated during the build process and should not be manually edited:
- LoveToType.love (the game package)

## Usage
To test the web version locally, run `make run-web` from the project root. 