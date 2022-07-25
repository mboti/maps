import 'package:flutter/material.dart';

class CustomDrawerHeader extends StatelessWidget{
  const CustomDrawerHeader({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        child: Column(
          children: [
            Text("Apprendre les cartes",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 25,
                fontWeight: FontWeight.w300,
              ),
            ),
            Icon(
              Icons.map_outlined,
              color: Theme.of(context).primaryColor,
              size: 50
            ),
          ],
        )
    );
  }
}