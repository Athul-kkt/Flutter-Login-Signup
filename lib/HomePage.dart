import 'package:SignUp/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:SignUp/SignUp.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _currentIndex=0;
  var list =[
    Center(
        child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.file(
              datas[index].image,
              width: 100.0,
              height: 100.0,
              fit: BoxFit.fill,
              ),
            ),
          Text(
            datas[index].fName +' '+ datas[index].lName, 
            style: TextStyle(fontSize:35, fontWeight: FontWeight.bold)
          ),
          Text(
            datas[index].email, 
            style: TextStyle(fontSize:15, color: Colors.grey)
          ),
          Text(
            datas[index].number, 
            style: TextStyle(fontSize:15, color: Colors.grey)
          ),
        ],
          
        ),
      ) ,
      Center(
        child: 
        Column(children: [
          Text('Home')
        ],
          
        ),
      ) ,
      Center(
        child: 
        Column(children: [
          Text('Settings')
        ],
          
        ),
      ) ,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.grey,
            icon: Icon(Icons.account_circle),
            title: Text('Profile')
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings')
            )  
        ],
        onTap: (index){
          setState(() {
            _currentIndex=index;
          });
        },
        ),
    );
  }
}