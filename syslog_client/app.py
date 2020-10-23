import syslog_client
import os

from flask import Flask

app = Flask(__name__)
if not os.path.exists('/tmp/server_started'):
    os.mknod('/tmp/server_started')

log = syslog_client.Syslog()


@app.route('/', methods=["GET"])
def generate_syslog():
    log.send("{\"host\": \"Staff-Device-Syslog-Host\", \"ident\": \"1\", \"message\": \"Hello Syslog\", \"pri\": \"134\"}", syslog_client.Level.WARNING)
    return "Generating log"
