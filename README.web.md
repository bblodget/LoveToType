# LoveToType - Web Version

This is the web version of "Love To Type", a typing tutor originally created using LÖVE 2D game engine. This version has been ported to run in web browsers using WebAssembly through the love.js project.

## How to Run Locally

### Prerequisites

- Node.js (version 14 or newer)

### Running the Web Server

1. Clone this repository:
   ```
   git clone https://github.com/bblodget/LoveToType.git
   cd LoveToType
   ```

2. Start the Node.js server:
   ```
   node server.js
   ```

3. Open your browser and navigate to:
   ```
   http://localhost:8000
   ```

## Deploying to a Web Server

To deploy to a web server, copy the contents of the `web-dist` directory to your web server's public directory. Make sure your server is configured to send the proper CORS headers:

```
Header set Cross-Origin-Opener-Policy "same-origin"
Header set Cross-Origin-Embedder-Policy "require-corp"
```

For Apache servers, you can use the included `.htaccess` file in the `web-dist` directory.

## Controls

- **Typing**: Type the displayed words
- **Space/Enter**: Submit your typed word
- **Escape**: Return to menu
- **Mouse**: Click on buttons for menu navigation

## About the Original

Love To Type is based on the TI-99/4a Touch Typing Tutor program from the early 1980s. This typing tutor was designed for learning touch typing in a fun and engaging way.

## License

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

## Credits

- Original program by Brandon Blodget
- Web version uses love.js by [2dengine](https://github.com/2dengine/love.js) 