import sys
from http.server import HTTPServer, SimpleHTTPRequestHandler
from functools import partial

directory = "/Users/brenosilva/Downloads/BCM"
port = int(sys.argv[1]) if len(sys.argv) > 1 else 3000

handler = partial(SimpleHTTPRequestHandler, directory=directory)
print(f"Serving on http://localhost:{port}", flush=True)
HTTPServer(("", port), handler).serve_forever()
