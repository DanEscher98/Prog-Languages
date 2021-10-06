#http://localhost:8004/sqr.html

#https://stackoverflow.com/questions/336866/how-to-implement-a-minimal-server-for-ajax-in-python

import http.server

class TestHandler(http.server.SimpleHTTPRequestHandler):

    def do_POST(self):
        """Handle a post request by returning the square of the number."""
        length = int(self.headers.get_all('content-length')[0])
        data_string = self.rfile.read(length)
        x = float(data_string)
        self.send_response(200)
        self.send_header("Content-type", "text/plain")
        self.end_headers()
        self.flush_headers()
        self.wfile.write(str(x**2).encode())

server = http.server.HTTPServer(("", 8004), TestHandler)
server.serve_forever()
