import 'package:flutter/material.dart';
import 'EmailScreen.dart';
import 'HomeScreen.dart';
import 'AirPlayScreen.dart';
import 'PageScreen.dart';
class BottomNaivgationWidget extends StatefulWidget {
  @override
  _BottomNaivgationWidgetState createState() => _BottomNaivgationWidgetState();
}

class _BottomNaivgationWidgetState extends State<BottomNaivgationWidget> {
  final _BottomNaivgationColor = Colors.blue;
int _currentIndex = 0;
List<Widget> list = List();

@override
  void initState() {
    // TODO: implement initState
    list..add(HomeScreen())
    ..add(EmailScreen())..add(AirPlayScreen())..add(PageScreen());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color:_BottomNaivgationColor),
            title: Text('Home',style: TextStyle(color: _BottomNaivgationColor),)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.email,color:_BottomNaivgationColor),
            title: Text('Email',style: TextStyle(color: _BottomNaivgationColor),)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pages,color:_BottomNaivgationColor),
            title: Text('Pages',style: TextStyle(color: _BottomNaivgationColor),)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplay,color:_BottomNaivgationColor),
            title: Text('Airplay',style: TextStyle(color: _BottomNaivgationColor),)
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (int index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}