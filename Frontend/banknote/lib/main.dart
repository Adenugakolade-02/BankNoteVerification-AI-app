import 'package:banknote/field.dart';
import 'package:banknote/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: HomeScreen()
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {


    double varianceText=0 ;
    double skewnessText=0 ;
    double curtosisText=0; 
    double entropyText=0 ;
    // bool _loading = false;
    String? result;

    
    Map<String, double>? data;
    
    void dataSaved(){
      setState(() {
              data= {
          "variance": varianceText,
          "skewness": skewnessText,
          "curtosis": curtosisText,
          "entropy": entropyText
        };
        print('Data saved');
      });
    }

    void savePrediction(String prediction){

    }
    

    void savedElement() async{

      // String? pred = await AppModel(data!).getPrediction(context);
      
      // setState(() {
      // result = pred;
      // print('the result is $result');
      // });

      dataSaved();

      String? pred = await AppModel(data!).getPrediction(context);
      
      setState(() {
      result = pred;
      print('the result is $result');
      });

      showDialog(
        context: context,
        builder: (ctx)=> AlertDialog(
          title: Text("Prediction"),
          content: result==null? const Center(child: CircularProgressIndicator()): Text(result!, style: const TextStyle(fontWeight: FontWeight.bold),),
        actions: [
          TextButton(
            child: Text("OK"),
            onPressed: () {
            Navigator.of(context).pop();
            },)
      ],)
      );

      // String? pred = await AppModel(data!).getPrediction(context);
      
      // setState(() {
      // result = pred;
      // print('the result is $result');
      // });
    
  }


    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: const Text('Verify Note'),actions: [IconButton(onPressed: savedElement, icon: const Icon(Icons.save))]),
        body: LayoutBuilder(
          builder: (context,constraints){
            return Container(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: ListView(
              children: [
                TextWithFields("Enter Variance", "Variance", (value){varianceText = double.parse(value);}),
                TextWithFields("Enter Skewness", "Skewness", (value){skewnessText = double.parse(value);}),
                TextWithFields("Enter Curtosis", "Curtosis", (value){curtosisText = double.parse(value);}),
                TextWithFields("Enter Entropy", "Entropy", (value){entropyText = double.parse(value);}),
              ]
            ),
          );
      })
        ,
      );
  }
}