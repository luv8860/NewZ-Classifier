from flask import Flask,jsonify,request
import json
import pickle
import numpy
app=Flask(__name__)

clf = pickle.load(open('model', 'rb'))
cv=pickle.load(open('tfidf_transform','rb'))

@app.route('/',methods=['POST','GET'])

def category():
    if request.method=='POST':
        request_data = request.data
        request_data = json.loads(request_data.decode('utf-8'))
        text = request_data['text']
        data = [text]
        vect = cv.transform(data).toarray()
        my_prediction = clf.predict(vect)
        print(my_prediction)
        x=int(my_prediction[0])
        return jsonify({'result': x})
    else:
        return ''

if __name__=='__main__' :
    app.run()