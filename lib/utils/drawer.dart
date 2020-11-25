import 'package:flutter/material.dart';

class MenuDesplegable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Drawer(
      elevation: 20.0,
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: size.height * 0.07,
              ),
              Divider(),
              SizedBox(
                height: size.height * 0.008,
              ),
              Text('Desarrollado Por'),
              Text(
                'LULOSYS',
                style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
            ],
          ),

          // color: Color.fromRGBO(61, 197, 37, 1),
        ),
      ),
    );
  }
}
