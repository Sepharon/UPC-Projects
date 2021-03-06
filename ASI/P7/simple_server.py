#-*- encoding: utf-8 -*-

import SimpleHTTPServer as server
import BaseHTTPServer as base
import led

class LEDHTTPRequestHandler(base.BaseHTTPRequestHandler):
        
        def _head_html(self):
                self.send_response(200)
                self.send_header("Content−type2", "text/html")
		self.end_headers()

        def _head_error_404(self):
                self.send_error(404,"File not found")

        def do_GET(self):
                path = self.path
                host = self.headers['Host']
                print 'URL: {0} al servidor {1}'.format(path,host)
                if path == '/led':
                        self._LED_ESTAT()
                        #self._Led_ON()
                #elif path == '/led_off':
                        #self._Led_OFF()
                else:
                        self._head_error_404()
        
        def _LED_ESTAT(self):
                if led.estat(18) == True:
                        self._Led_ON()
                else:
                        self._Led_OFF()

        def _Led_ON(self):
                
                self._head_html()
		resposta ="""
                <html>
                <head>
                <meta http-equiv="refresh" content="0; url=http://pi.g2.asi.itic.cat:808/led_on.html">
                </head>
                </html>
                """
                self.wfile.write(resposta)
                led.on()

        def _Led_OFF(self):

                self._head_html()
		resposta =  """
                <html>
                <head>
                <meta http-equiv="refresh" content="0; url=http://pi.g2.asi.itic.cat:808/led_off.html">
                </head>
                </html>
                """
                self.wfile.write(resposta)
                led.off()



led.setup(18)
PORT = 8000
Handler = LEDHTTPRequestHandler
httpd = base.HTTPServer(("",PORT),Handler)
print "Serving at port: " + str(PORT)
httpd.serve_forever()
