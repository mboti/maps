

import 'package:flutter/material.dart';

class NoDataController extends StatelessWidget{
  const NoDataController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("Aucune donnée pour le moment",
          style: TextStyle(
              //color: Theme.of(context).primaryColor,
              fontSize: 30,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
  
}