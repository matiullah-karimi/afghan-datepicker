import 'package:flutter/material.dart';
import 'package:afghan_date_picker/afghan_date_picker.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  HomeState createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController textEditingController = TextEditingController();

  AfghanDatePicker persianDatePicker;

  @override
  void initState() {
    persianDatePicker = AfghanDatePicker(
      controller: textEditingController,
      locale: "ps",
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Afghan Datepicker'),
        ),
        body: Builder(builder: (BuildContext context) {
          return Container(
            child: TextField(
              enableInteractiveSelection:
                  false, // *** this is important to prevent user interactive selection ***
              onTap: () {
                FocusScope.of(context).requestFocus(
                    new FocusNode()); // to prevent opening default keyboard
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Center(child: Container(padding: EdgeInsets.all(10), child: persianDatePicker));
                    });
              },
              controller: textEditingController,
            ),
          );
        }),
      ),
    );
  }
}
