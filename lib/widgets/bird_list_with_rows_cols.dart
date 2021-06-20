import 'package:flutter/material.dart';

class BirdListWithRowsCols extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image(
              width: 100.00,
              image: AssetImage('images/hornbill.jpg'),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Hornbill',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Bucerotidae',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 18.0,
                      fontFamily: 'Pacifico',
                      fontStyle: FontStyle.italic,
                    ),
                  )
                ],
              ),
            ),
            Text(
              'Delete',
              style: TextStyle(
                color: Colors.red,
              ),
            )
          ],
        ),
      ],
    );
  }
}
