from fastapi import FastAPI
import uvicorn
import pickle
from pydantic import BaseModel

class BankNote(BaseModel):
    variance : float
    skewness: float
    curtosis: float
    entropy: float

class Note(variance: float, skewness: float, curtosis: float, entropy: float){

}


app = FastAPI(debug=True)

classifier = pickle.load(open('revamped.pickle','rb'))
status =''


@app.get('/')
def home():
    return {'text':'This is a trial'} 

@app.get('/predict/{variance,skewness, curtosis,entropy}')
def predict_notes(variance: float, skewness: float, curtosis: float, entropy: float):
    # data = data.dict()
    # variance = data['variance']
    # skewness = data['skewness']
    # curtosis = data['curtosis']
    # entropy = data['entropy']

    prediction = classifier.predict([[variance, skewness, curtosis, entropy]])

    if(prediction[0]>0.5):
        status = 'FakeNote'
    else:
        status = 'Original'
    return {
        'prediction': status
    }

if __name__ == '__main__':
    uvicorn.run(app)