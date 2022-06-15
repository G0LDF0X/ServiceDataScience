import os

terminal_command = "pip install firebase_admin && pip install flask && pip install waitress"
os.system(terminal_command)

# terminal_command = "pip install haversine"
# os.system(terminal_command)

# terminal_command = "pip install flask"
# os.system(terminal_command)

from flask import Flask
from flask import Flask, jsonify, abort
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
import json
import time
import warnings

app = Flask(__name__)
app.config['JSON_AS_ASCII'] = False

@app.route('/', method = ['POST'])
def looking():
  warnings.filterwarnings('ignore')

  if not firebase_admin._apps:
     cred = credentials.Certificate('petbang-9b8f3-firebase-adminsdk-a7i2o-3cfeaa8688.json') 
     default_app = firebase_admin.initialize_app(cred)

  db = firestore.client()

  _user_place = db.collection(u'user').stream()

  for i in _user_place:
     user_place = i.to_dict()
     find_place = user_place['select']

  finding = db.collection(u'data_apt').where(u"`주소`", u'==', f'{find_place}').stream()

  for i in finding:
     result = i.to_dict()

  return jsonify(result)

# if __name__ == '__main__':
#     app.run(host='0.0.0.0')


from werkzeug.exceptions import HTTPException, default_exceptions, _aborter


def JsonApp(app):
    def error_handling(error):
        if isinstance(error, HTTPException):  # HTTP Exeption의 경우
            result = {
                'code': error.code,
                'description': error.description,
                'message': str(error)
            }
        else:
            description = _aborter.mapping[500].description # 나머지 Exception의 경우
            result = {
                'code': 500,
                'description': description,
                'message': str(error)
            }
        resp = jsonify(result)
        resp.status_code = result['code']
        return resp
        
    for code in default_exceptions.keys(): # 에러 핸들러 등록 
        app.register_error_handler(code, error_handling)

    return app


# app = JsonApp(Flask(__name__))


@app.route('/api')
def my_service():
    raise TypeError("Some Exception...")


if __name__ == "__main__":
    from waitress import serve
    serve(app, host='0.0.0.0', port=8888)