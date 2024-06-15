import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";

  var bgColor = Colors.lightBlueAccent.shade100;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text('yourBMI')),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: bgColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('BMI', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter your weight in Kg.'),
                    prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),

              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text('Enter your height in Ft.'),
                    prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),

              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    label: Text('Enter your height in In.'),
                    prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),

              SizedBox(height: 10),

              ElevatedButton(onPressed: (){
                var wt = wtController.text.toString();
                var ft = ftController.text.toString();
                var inch = inController.text.toString();

                if(wt!="" && ft!="" && inch!=""){

                  var iWt = int.parse(wt);
                  var iFt = int.parse(ft);
                  var iInch = int.parse(inch);

                  var tInch = (iFt*12) + iInch;
                  var tCm = tInch*2.54;
                  var tM= tCm/100;
                  var bmi = iWt/(tM*tM);

                  var msg = "";

                  if(bmi>25){
                    msg = "You are OverWeight!";
                    bgColor = Colors.red;
                  }else if(bmi<18){
                    msg = "You are UnderWeight";
                    bgColor = Colors.yellow;
                  }else{
                    msg = "Ypu are Healthy!";
                    bgColor = Colors.green;
                  }

                  setState(() {
                    result = '$msg \n Your BMI is $bmi';
                  });

                }else{
                  setState(() {
                    result = 'Please fill all the required blanks!!';
                  });
                }
              },
                  child: Text('Calculate')),

              SizedBox(height: 10),

              Text(result, style: TextStyle(fontSize: 20),),
            ],
          ),
        ),
      )
    );
  }
}
