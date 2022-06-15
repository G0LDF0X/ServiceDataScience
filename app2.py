import os

terminal_command = "pip install firebase_admin && pip install haversine && pip install flask && pip install pandas && pip install numpy && pip install sklearn && pip install waitress"
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
from haversine import haversine
import json
import numpy as np
import pandas as pd
import time
from sklearn.cluster import KMeans as KMeans_
import warnings

# terminal_command = "export FLASK_APP = app2"
# os.system(terminal_command)



def extract_xy(docs):
  x = []
  y = []
  address = []

  for doc in docs:
    doc_ref = doc.to_dict()
    x.append(float(doc_ref['위도']))
    y.append(float(doc_ref['경도']))
    address.append(doc_ref['주소'])

  return x, y, address

def cal_dist(db, place, apt_x, apt_y):
  data_anm = db.collection(u'data_anm').where(u"`종류`", u'==', f'{place}').stream()

  anm_x = []
  anm_y = []
  anm_address = []
  aver_dist = []
  anm_num = []

  anm_x, anm_y, anm_address = extract_xy(data_anm)
  for i in range(len(apt_x)):
    tmp = []
    for j in range(len(anm_x)):
      apt_location = (apt_x[i], apt_y[i])
      anm_location = (anm_x[j], anm_y[j])
      location = haversine(apt_location, anm_location, unit ='km')
      if location <= 1:
        tmp.append(location)
    
    if len(tmp) != 0:
      anm_num.append(len(tmp))
      aver_dist.append(sum(tmp) / len(tmp))
    else:
      anm_num.append(0)
      aver_dist.append(0)

  return aver_dist, anm_num

def cal_score(first, second, third):
  final_score = []
  for i in range(len(first)):
    score = 0

    if (first[i] == 0):
      first_tmp = 0
    else:
      first_tmp = 1/first[i]

    if (second[i] == 0):
      second_tmp = 0
    else:
      second_tmp = 1/second[i]
    
    if (third[i] == 0):
      third_tmp = 0
    else:
      third_tmp = 1/third[i]
    
    score = first_tmp * 0.5 + second_tmp * 0.3 + third_tmp * 0.2
    final_score.append(score)

  return final_score

app = Flask(__name__)

@app.route('/')
def working():
  warnings.filterwarnings('ignore')

  if not firebase_admin._apps:
    cred = credentials.Certificate('petbang-9b8f3-firebase-adminsdk-a7i2o-3cfeaa8688.json') 
    default_app = firebase_admin.initialize_app(cred)

  db = firestore.client()

  data_apt = db.collection(u'data_apt').stream()
  apt_x, apt_y, apt_address = extract_xy(data_apt)
  user_data = db.collection(u'user').stream()
  
  for doc in user_data:
    docs = doc.to_dict()
    first_place = docs['first']
    second_place = docs['second']
    third_place = docs['third']

  first_aver_dist, first_anm_num = cal_dist(db, first_place, apt_x, apt_y)
  second_aver_dist, second_anm_num = cal_dist(db, second_place, apt_x, apt_y)
  third_aver_dist, third_anm_num = cal_dist(db, third_place, apt_x, apt_y)

  final_score = cal_score(first_aver_dist, second_aver_dist, third_aver_dist)

  final_df = pd.DataFrame({'주소': apt_address, '첫 번째 요소 평균 거리(km)' : first_aver_dist, '첫 번째 요소 개수' : first_anm_num, '두 번째 요소 평균 거리(km)' : second_aver_dist, '두 번째 요소 개수' : second_anm_num,
                           '세 번째 요소 평균 거리(km)' : third_aver_dist, '세 번째 요소 개수' : third_anm_num, '최종 점수' : final_score})
  
  X = final_df[['최종 점수', '최종 점수']]

  kmeans = KMeans_(n_clusters = 5, max_iter = 500, tol = 0.001, n_init = 100).fit(X) # 여기서 k(n_clusters) 결정

  final_df['Rank'] = kmeans.labels_

  rank_list = [0, 1, 2, 3, 4]
  scoring = []
  count_list = []
  for i in rank_list:
      count = 0
      rank = final_df[final_df['Rank'] == i]
      count = rank.shape[0]
      scoring.append(rank['최종 점수'].mean())
      count_list.append(count)
  
  rank_df = pd.DataFrame({'Rank' : rank_list, 'Scoring' : scoring, 'Count' : count_list})
  rank_df = rank_df.sort_values('Scoring',  ascending=False) # 점수 높은 순 정렬

  result_df = pd.DataFrame({'주소': '', '첫 번째 요소 평균 거리(km)' : [], '첫 번째 요소 개수' : [], '두 번째 요소 평균 거리(km)' : [], '두 번째 요소 개수' : [],
                           '세 번째 요소 평균 거리(km)' : [], '세 번째 요소 개수' : [], '최종 점수' : [], 'Rank' : [], 'Real Rank' : []})

  for i in range(len(rank_list)):
      best = final_df['Rank'] == rank_df.iloc[i]['Rank']
      best_house = final_df[best]
      real_rank = []
      for j in range(len(best_house)):
          real_rank.append(i)
      best_house['Real Rank'] = real_rank
      result_df = pd.concat((best_house, result_df), sort=False)


  for i in range(len(apt_x)):
    input_data = result_df.iloc[i].to_dict()
    db.collection(u'recommend').document(f'{i}').set(input_data)

  res_print = {'result' : 'Working Well'}
  
  return jsonify(res_print)

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
    serve(app, host='0.0.0.0', port=8080)