import 'package:flutter/material.dart';
import 'package:fyp_application/constant.dart';

class LoginWidget extends StatefulWidget{
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Login createState() => new Login();
  }




class Login extends State<LoginWidget> {

  bool _obscureText = false;

  @override
  Widget build(BuildContext context) {

  Size size = MediaQuery.of(context).size;    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Container(
         decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg0.png"),
            fit: BoxFit.cover,
          )
        ),
        alignment: Alignment.center,
        child: Container(
          height: 500,
          width:350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              Padding(
                child: Align(
                    child: Text("Login",
                      style: TextStyle(color: Colors.white, fontSize: 40,fontWeight: FontWeight.bold,
                      shadows:[Shadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: Offset(5, 5),
                            blurRadius: 15)] ),
                    
                  ), 
                  alignment: Alignment.centerLeft,
                ),
                padding: EdgeInsets.only(bottom: 15.0),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  color: Colors.white,
                  height: 400,
                  width:350,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Divider(
                        indent: 20,
                        endIndent: 20,
                      ),
                      Padding(
                        
                        child: TextField(
                      obscureText: false,
                      style: TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          icon: Icon(Icons.person,color: kPrimaryColor),
                          labelText: 'Username or Email',
                        ),
                      ),
                      padding: EdgeInsets.only(top:20,left:20,right:20,bottom:10), 
                      ),
                     Padding(
                      child: TextFormField(
                      obscureText: _obscureText,
                      style: TextStyle(fontSize: 15),
                      //validator: (val) => val.length < 6 ? 'Password too short.' : null,
                        decoration: InputDecoration(
                          icon: Icon(Icons.lock,color: kPrimaryColor),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          labelText: 'Passsword',
                          suffixIcon: GestureDetector(
                              onTap: (){
                                setState(() {
                                  _obscureText = !_obscureText;
                                  debugPrint('hahahaha');
                                  debugPrint('$_obscureText');
                                });
                              },
                              child: Icon(
                                _obscureText
                                    ? Icons.visibility_rounded
                                    : Icons.visibility_off_rounded,
                                size: 24,
                              ),
                            ),
                          
                        ),
                      ),
                      padding: EdgeInsets.only(left:20,right:20,bottom:10), 
                      ),
                      ElevatedButton(
                        onPressed: (){}, 
                        child: Text(
                        "LOGIN"),
                        style: ButtonStyle(

                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        )
                      ),
                      TextButton(
                        onPressed: (){}, 
                        child: Text(
                        "Forgot Password ?"),
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                          ),
                      ),
                      TextButton(
                        onPressed: (){}, 
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.normal),
                            children: const <TextSpan>[
                              TextSpan(text: 'Dont have an account ?'),
                              TextSpan(text: ' Register', style: TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          )),
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
                          ),
                        ),
                      Divider(
                        indent: 20,
                        endIndent: 20,
                      ),
                    ],
                  ), 
                )
              ),
            
              
            ],
          )
        ),
        
        
        ),
      ),
    );
  }
}