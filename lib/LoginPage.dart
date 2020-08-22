import 'package:SignUp/SignUp.dart';
import 'package:flutter/material.dart';
  var index;
class LoginPage extends StatelessWidget {
 final _loginformKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

  void welcome(){
    showDialog(
       context: context,
       builder: (BuildContext context){
        return AlertDialog(
          title: Row(children: [
            Icon(Icons.account_circle),
            Text('Welcome '+datas[0].fName)
          ],
              ) ,
          actions: [
            FlatButton(
              onPressed: (){
                Navigator.pushNamed(context, '/Home');
              }, 
              child: 
              Text('OK')
              ),
              FlatButton(
              onPressed: ()=>Navigator.pop(context), 
              child: 
              Text('Cancel')
              )
          ],
        );
       }
     );
  }

    return Scaffold(
      appBar:null,
      body:Center(
        child: SingleChildScrollView(
        child: Form(
          key: _loginformKey,
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[  
            Container(
              padding: EdgeInsets.all(10),
              child: 
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.blue)
                  ), 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.green)
                  ), 
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Email adress Required';
                  }
                  if (!RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value)) {
                  return 'Enter a valid email address!!!';
                  }
                  for(int i=0;i<datas.length;i++){
                    if(datas[i].email != value){
                     return 'Invalid User';
                    }
                    else if(datas[i].email == value){
                        index=i;
                    }
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: 
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.blue)
                  ), 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.green)
                  ), 
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Password Required';
                  }
                  else if(datas[index].password != value){
                    return 'Incorrect Password';
                  }
                  else{
                  return null;
                  }
                },
              ),
            ),
             RaisedButton(
                 child: 
                  Text('LogIn', style: TextStyle(
                      fontSize:15, fontWeight: FontWeight.bold,color: Colors.white,),
                      ),
                  color:Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  onPressed:() {
                      if(_loginformKey.currentState.validate()){
                        welcome();
                        }
                      else{
                        
                      }
                      return null;
                  },
              ),    
              RaisedButton(
                 child: 
                  Text('SignUp', style: TextStyle(
                      fontSize:15, fontWeight: FontWeight.bold,color: Colors.white,),
                      ),
                  color:Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  onPressed:()=>Navigator.pushNamed(context, '/SignUp')    
              )   

            ]
            )
        )
        )
      )




      
    );
  }
}