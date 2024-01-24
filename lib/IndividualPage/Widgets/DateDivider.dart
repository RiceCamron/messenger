import 'package:flutter/material.dart';

class DateDivider extends StatelessWidget {
  const DateDivider({Key? key, required this.date}) : super(key: key);
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.center,
      height: 50,
      width: double.infinity,
      // color: Colors.grey[200],
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width - 280,
            color: Color.fromRGBO(237, 242, 246, 1),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18.0),
            child: Text(
                date,
                style: TextStyle(
                  fontSize: 14,
              color: Color.fromRGBO(157, 183, 203, 1),
                ),
              ),
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width - 280,
            color: Color.fromRGBO(237, 242, 246, 1),
          ),
        ],
      ),
    );
  }
}
