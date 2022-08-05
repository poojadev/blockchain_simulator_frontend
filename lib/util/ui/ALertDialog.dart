import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Alerts(BuildContext context, String message) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return
        Column(children: [

        Expanded(
        child: AlertDialog(
          //title: Text('Welcome'),
          content: Text(message),
          actions: [
            Container(
              width: 80,
              child:   OutlinedButton(

                onPressed: () async {
                  Navigator.of(context).pop();
                },
              style: OutlinedButton.styleFrom(
                  elevation: 6,
                  // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  padding: const EdgeInsets.all(15),

                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
          child: const Text(
            'Ok',
            style: TextStyle(fontSize: 15,color: Colors.white),
          ),
              ),
            )
          ],
        ),
      )]);
    },
  );
}