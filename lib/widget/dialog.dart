import 'package:flutter/material.dart';

showDescriptionDialog(
    {required BuildContext context,
    required String title,
    required void acceptFunction()}
  ) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 15,
            fontFamily: 'text',
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            child: Text(
              "취소",
              style: TextStyle(fontFamily: 'text', color: Colors.red),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            onPressed: acceptFunction,
            child: Text(
              "확인",
              style: TextStyle(fontFamily: 'text', color: Colors.lightBlue),
            ),
          ),
        ],
      ),
    );
  }