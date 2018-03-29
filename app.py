from flask import Flask, Response
import os

app = Flask(__name__)

port = os.getenv("VCAP_APP_PORT", 5000)


def root_dir():
    return os.path.abspath(os.path.dirname(__file__))


def get_file(filename):
    try:
        src = os.path.join(root_dir(), filename)
        return open(src).read()
    except IOError as exc:
        return str(exc)


@app.route('/')
def hello_world():
    content = get_file('index.html')
    return Response(content, mimetype="text/html")


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=port)
