const http = require('http');
const fs = require('fs');
const path = require('path');

const PORT = 8000;
const DIRECTORY = './web-dist';

const MIME_TYPES = {
  '.html': 'text/html',
  '.js': 'text/javascript',
  '.css': 'text/css',
  '.json': 'application/json',
  '.png': 'image/png',
  '.jpg': 'image/jpg',
  '.gif': 'image/gif',
  '.svg': 'image/svg+xml',
  '.wav': 'audio/wav',
  '.mp3': 'audio/mpeg',
  '.woff': 'application/font-woff',
  '.ttf': 'application/font-ttf',
  '.eot': 'application/vnd.ms-fontobject',
  '.otf': 'application/font-otf',
  '.wasm': 'application/wasm',
  '.love': 'application/octet-stream',
  '.ogg': 'audio/ogg'
};

const server = http.createServer((request, response) => {
  console.log(`Request URL: ${request.url}`);
  
  // Set CORS headers for WebAssembly
  response.setHeader('Cross-Origin-Opener-Policy', 'same-origin');
  response.setHeader('Cross-Origin-Embedder-Policy', 'require-corp');
  
  let filePath = path.join(DIRECTORY, request.url === '/' ? 'index.html' : request.url);
  const extname = String(path.extname(filePath)).toLowerCase();
  
  // Serve index.html for any route that doesn't map to a file
  fs.access(filePath, fs.constants.F_OK, (err) => {
    if (err && !extname) {
      filePath = path.join(DIRECTORY, 'index.html');
    }
    
    const contentType = MIME_TYPES[extname] || 'application/octet-stream';
    
    fs.readFile(filePath, (error, content) => {
      if (error) {
        if (error.code === 'ENOENT') {
          console.error(`File not found: ${filePath}`);
          response.writeHead(404);
          response.end('404 File Not Found');
        } else {
          console.error(`Server error: ${error.code}`);
          response.writeHead(500);
          response.end(`Server Error: ${error.code}`);
        }
      } else {
        response.writeHead(200, { 'Content-Type': contentType });
        response.end(content, 'utf-8');
      }
    });
  });
});

server.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}/`);
  console.log(`Serving files from ${DIRECTORY}`);
}); 