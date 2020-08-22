import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:SignUp/UserData.dart';
var _data =Data();
List<Data> datas=[];
String passWord;
bool view=false;
class SignUpPage extends StatefulWidget {
  @override
  _MyState createState() => _MyState();
}

class _MyState extends State<SignUpPage> {

    File _image;
     void _selectDialog(){
     showDialog(
       context: context,
       builder: (BuildContext context){
        return AlertDialog(
          title: Text('Profile Picture'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                  IconButton(
                    color: Colors.cyan,
                    icon: Icon(Icons.photo_library),
                    onPressed:(){
                      Navigator.pop(context);
                       _openGallary();
                    }
                  ),
                  Text("Gallery")
                ],),
                 Column(children: [
                  IconButton(
                    icon: Icon(Icons.camera_alt),
                    onPressed: (){
                      Navigator.pop(context);
                       _openCamera();
                    }
                  ),
                  Text("Camera")
                ],),
                 Column(children: [
                  IconButton(
                    color: Colors.red,
                    icon: Icon(Icons.delete),
                    onPressed: (){
                      Navigator.pop(context);
                       _delete();
                    }
                  ),
                  Text("Delete")
                ],)
              ],),
          ],
        );
       }
     );
  }


   
  Future<void>_openGallary() async{
     final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    this.setState(() {
      _image=File(pickedFile.path);
      _data.image=_image;
    });
  }
  void _delete(){
    setState(() {
       _image=null;
       _data.image=_image;

    });
  }
   Future<void>_openCamera() async{
     final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
    this.setState(() {
      _image=File(pickedFile.path);
      _data.image=_image;
    });
  }

  void _dialog(){
     showDialog(
       context: context,
       builder: (BuildContext context){
        return AlertDialog(
          title: Text("Submitted Successfully"),
          actions: [
            FlatButton(
              onPressed: (){
                setState(() {
                   _formKey.currentState.save();
                  datas.add(_data);
                  print(datas.length);
                });
                Navigator.popUntil(context, ModalRoute.withName('/'));
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


  final bool view= true;
  bool _checkBobValue = false;
  bool profilePic=false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: 
      AppBar( 
        title: Text('Sign Up')
      ),
      body:Center(
        child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
                Text('Sign Up',
                  style: TextStyle(
                    fontSize:25, 
                    fontWeight: FontWeight.bold,
                    color: Colors.blue
                  ),
                ),

                 //button for selecting profile picture
               
                _image==null? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Icon(Icons.account_circle,size: 150,color: Colors.grey,),
                  Text('Select a profile picture',style: TextStyle(fontSize:20,)),

                 ]): ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.file(
                         _image,
                        width: 150.0,
                        height: 150.0,
                        fit: BoxFit.fill,
                    ),
                  ),
                 FloatingActionButton(
                  onPressed:(){
                    _selectDialog();
                    setState(() {
                      profilePic=true;
                    });
                    },
                  tooltip: 'Pick Image',
                  child: Icon(Icons.add_a_photo),
                  ), 

                Name('First Name'),
                Name('Last Name'), 
                Name('Email'),
                Name('Phone Number'),
                Name('Password'),
                Name('Confirm Password'),

               

                //check box

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(value: _checkBobValue,
                    activeColor: Colors.blue,
                    onChanged:(bool newValue){
                    setState(() {
                      _checkBobValue=newValue;
                    });
                   }),
                 Text('Agree terms & Condetions'),
                 ],),


                 //Submit button

                RaisedButton(
                 child: 
                  Text('Submit', style: TextStyle(
                      fontSize:15, fontWeight: FontWeight.bold,color: Colors.white,),
                      ),
                  color:Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  onPressed:_checkBobValue && profilePic? () {
                      if(_formKey.currentState.validate()){
                        _dialog();
                      }
                      else{
                      return null;
                      }
                  }:null,



               )
             ],
          )
        )
        )
      )
    );
  }
}

class Name extends StatelessWidget {
  final String feildName;
  Name(this.feildName);
  @override
  Widget build(BuildContext context) {
    bool number=false;
    bool email=false;
      if (this.feildName=='Phone Number'){
        number=true;
      }
      if (this.feildName=='Email'){
        email=true;
      }
    
    view=false;
    if (this.feildName=='Password' || this.feildName=='Confirm Password') {
      view=true;
    }
    return Container(
      padding: EdgeInsets.all(10),
      child: 
      TextFormField(
        keyboardType:
        number || email? 
        email? TextInputType.emailAddress 
        :TextInputType.number :TextInputType.text,
        obscureText: view,
        decoration: InputDecoration(
          labelText: feildName,
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

        onSaved:(value){
          if(this.feildName=='Password'){
            passWord=value;
          }
        },

        validator: (value) {
          if (value.isEmpty) {
            return '$feildName Required';
          }
          if(this.feildName=='Password'){
            passWord=value;
            _data.password=value;
          }
          if(this.feildName == 'Email'){
            if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
            return 'Enter a valid email address!!!';
            }
            _data.email=value;
            return null;
          }
          if(this.feildName== 'First Name'){
            _data.fName=value;
          }
          if(this.feildName== 'Phone Number'){
            if (!RegExp("[0-9]{10}")
            .hasMatch(value)) {
            return 'Enter a valid Phone Number!!!';
            }
            _data.number=value;
           return null;
          }
          if(this.feildName== 'Last Name'){
            _data.lName=value;
          }
          if(this.feildName=='Confirm Password'){
            if(passWord != value){
              return 'Password Not Match';
            }
            return null;
          }
          return null;
        },
      ),
    );
  }
}
