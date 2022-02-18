# BankNoteVerification
## Title: Created an Mobile Application to help detect Fake or Original BankNote using Artificial Intelligence(AI)

### Problem: Lack of a Digital means to help detect if a Bank note is Fake or Original.

### Solutiion: Created an AI App that helps predict if note is fake or not, using the following parameters. Variance, Skewness, Curtosis, Entropy

#### Process: 
  1. I Trained a simple ML model(Random Forest) on my train data set gotten from [Kaggle](https://www.kaggle.com/ritesaluja/bank-note-authentication-uci-data) and achieved an accuracy of >95%
  2. Saved the model in pickle file needed for deployment process
  3. Used Fast API to create the APIs for the model to serve as my backend
  4. Deployed the bankend server/ API on heroku platform
  5. Created a Mobile app to consume the API and return the predictions of the BankNote based on the parameters entered by the user.
