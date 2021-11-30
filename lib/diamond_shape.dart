import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'diamond.dart';

class UserInput extends StatefulWidget {
  const UserInput({Key? key}) : super(key: key);

  @override
  _UserInputState createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  late TextEditingController textEditingController;
  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        title: Text("DIAMOND PATTERN",
          style: TextStyle(
            color: Colors.deepOrange,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(
              //   width: MediaQuery.of(context).size.width * 2.5,
              Flexible(
                child: TextFormField(
                  controller: textEditingController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 5.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 5.0),
                    ),
                    hintStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    hintText: 'Enter Number to Print Diamond Pattern',
                  ),
                ),
              ),
              // ),
              SizedBox(height: 50,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    onPrimary: Colors.white,
                    side: BorderSide(color: Colors.black, width: 1),
                    elevation: 25,
                    minimumSize: Size(120,50),
                    shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                  onPressed: () {
                    if (textEditingController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.purple,
                              content: Text('Must Enter a Number ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              )));
                    } else if (textEditingController.text.startsWith('0')  ) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.purple,
                              content: Text('Enter valid Number ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              )));
                    }
                    else {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          var userInput = int.parse(textEditingController.text);
                          return Diamond(userInput);
                        },
                      )).then((value) => textEditingController.clear());
                    }
                  },
                  child: const Text('calculate',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),

                  ))
            ]),
      ),
    );
  }
}