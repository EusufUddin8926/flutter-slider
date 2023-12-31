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
  var _dropDownValue;
  var _isChecked = false;
  var _isValue = false;
  List<String> checkboxValueslist = [
    "Checkbox 1",
    "Checkbox 2",
    "Checkbox 3",
    "Checkbox 4",
    "Checkbox 5"
  ];
  var selectedIndexes = [];

  void getValueFromCheckboxes() {
    if(!selectedIndexes.isEmpty){
      for (int i = 0; i < selectedIndexes.length; i++) {
        print('value: ${checkboxValueslist[selectedIndexes[i]]}');
        }
    }else{
      print("No value");
    }

  }

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
            height: 20,
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
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
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
          SizedBox(
            height: 20,
          ),
          Text(_dropDownValue == null ? "No Value" : _dropDownValue,
              style: TextStyle(fontSize: 20)),
          DropdownButton(
            items: [
              DropdownMenuItem(
                  child: Text("One", style: TextStyle(color: Colors.black)),
                  value: "One"),
              DropdownMenuItem(
                child: Text("Two", style: TextStyle(color: Colors.black)),
                value: "Two",
              )
            ],
            iconSize: 40,
            dropdownColor: Colors.grey,
            icon: Icon(Icons.arrow_drop_down),
            elevation: 0,
            underline: Container(
              height: 1.0,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(color: Colors.transparent, width: 0.0))),
            ),
            hint: Text("Select One"),
            padding: EdgeInsets.only(left: 30, right: 30, top: 10),
            onChanged: (value) {
              setState(() {
                _dropDownValue = value;
              });
            },
          ),
          SizedBox(
            height: 10,
          ),
          Dismissible(
            key: ValueKey("abc"),
            secondaryBackground: Container(
              color: Colors.red,
              child: Icon(Icons.delete, size: 40, color: Colors.black),
            ),
            background: Container(
              color: Colors.blue,
              child: Icon(Icons.delete, size: 40, color: Colors.white),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.only(left: 30, right: 30),
              title: Text("This is title"),
              subtitle: Text("This is sub title."),
              trailing: Icon(Icons.ac_unit),
            ),
          ),
          Text(
            _isChecked == false ? "unchecked" : "Checked",
            style: TextStyle(fontSize: 20),
          ),
          ListTileTheme(
            horizontalTitleGap: 0,
            child: CheckboxListTile(
              title: Text("Checkbox 1"),
              controlAffinity: ListTileControlAffinity.leading,
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value!;
                });
              },
            ),
          ),
          ListTileTheme(
            horizontalTitleGap: 0,
            child: CheckboxListTile(
              title: Text("Checkbox 2"),
              controlAffinity: ListTileControlAffinity.leading,
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value!;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: checkboxValueslist.length,
              itemBuilder: (BuildContext context, int index) {
                return CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(checkboxValueslist[index]),
                    value: selectedIndexes.contains(index),
                    onChanged: (_) {
                      setState(() {
                        setState(() {
                          if (selectedIndexes.contains(index)) {
                            selectedIndexes.remove(index);   // unselect
                          } else {
                            selectedIndexes.add(index);  // select
                          }
                          print(selectedIndexes);
                        });
                      });
                    });
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(onPressed: (){
            getValueFromCheckboxes();
          }, child: Text("Get Value")),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
