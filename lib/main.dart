import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _value = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Slider Demo"), backgroundColor: Colors.blueGrey),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                "Hello Slide",
                style: TextStyle(color: Colors.black, fontSize: _value),
              )),
          SizedBox(
            height: 50,
          ),
          Slider(
            value: _value,
            min: 10,
            max: 60,
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            },
          ),
          SizedBox(
            height: 20,
          ),
          RichText(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
                text: "Do you have account",
                style: TextStyle(fontSize: 20, color: Colors.black),
                children: [
                  WidgetSpan(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                    ),
                  ),
                  TextSpan(
                    text: "SignUp",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Sign Up Clicked"),
                          action: SnackBarAction(
                            label: "Ok",
                            textColor: Colors.white,
                            onPressed: () {
                              ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            },
                          ),
                          duration: Duration(milliseconds: 2000),
                        ));
                      },
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                        fontStyle: FontStyle.italic),
                  )
                ]),
          ),

        ],
      ),
    );
  }
}
