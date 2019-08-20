import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'CustomRouter.dart';

class Firstpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: Text('FirstPage',style: TextStyle(fontSize: 36)),
      elevation: 0.0,),
      body: Center(
        child: MaterialButton(
          child: Icon(
            Icons.navigate_next,
            color: Colors.white,
            size: 64.0,
          ),
          onPressed: (){
            Navigator.of(context).push(
              CustomRoute(SecondPage())
              // MaterialPageRoute(
              //   builder:(BuildContext context){
              //     return SecondPage();
              //   }
              // )
            );
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        title: Text('secondpage', style:TextStyle(fontSize:36.0)),
        backgroundColor: Colors.pinkAccent,
        leading: Container(),
        elevation: 4.0,
      ),
      body: Center (
        child: MaterialButton(
          child: Icon(
            Icons.navigate_before,
            color:Colors.white,
            size:64.0
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}