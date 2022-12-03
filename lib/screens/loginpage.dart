import 'package:flutter/material.dart';
import 'package:newlogin/admin/adminhomescrn.dart';
import 'package:newlogin/screens/homepage.dart';
import 'package:newlogin/screens/signuppage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
class SignInscrn extends StatefulWidget {
  const SignInscrn({Key? key}) : super(key: key);

  @override
  State<SignInscrn> createState() => _SignInscrnState();
}

class _SignInscrnState extends State<SignInscrn> {
  final _formkey= GlobalKey<FormState>();
  final TextEditingController emailcontroller = new TextEditingController();
  final TextEditingController passwordcontroller = new TextEditingController();

  final _auth=FirebaseAuth.instance;
  bool _isHidden=true;
  @override
  Widget build(BuildContext context) {

    final emailField = TextFormField(
      autofocus: false,
      controller: emailcontroller,
      style: TextStyle(fontFamily: 'Arimo'),
      keyboardType: TextInputType.emailAddress,
      validator: (value){
        if(value!.isEmpty){
          return("Please Enter your email");
        }
        if(!RegExp("^[a-zA-Z0-9+_.-]+@[bitsathy]+.[a-z]").hasMatch(value)){
          return("Please enter a valid email!");
        }
        return null;
      },
      onSaved: (value)
      {
        emailcontroller.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon:Icon(Icons.mail,color: Color.fromRGBO(77,0,114,1),),
        contentPadding: EdgeInsets.fromLTRB(20,15,20,15),
        hintText: "Email",
          hintStyle: TextStyle(fontFamily: 'Arimo'),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        )

      ),
    );
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordcontroller,

      style: TextStyle(fontFamily: 'Arimo'),
      obscureText: _isHidden,
      validator: (value){
        RegExp regex=new RegExp(r'^.{6,}$');
        if(value!.isEmpty){
          return("Password required");
        }
        if(!regex.hasMatch(value)){
          return("Please enter valid password(Min. 6 character");
        }
      },
      onSaved: (value)
      {
        passwordcontroller.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key,color: Color.fromRGBO(77,0,114,1),),
          contentPadding: EdgeInsets.fromLTRB(20,15,20,15),
          hintText: "Password",
          hintStyle: TextStyle(fontFamily: 'Arimo'),
          suffixIcon: InkWell(
            onTap: _toggleview,
            child: Icon(
              _isHidden
              ?Icons.visibility_off
                  :Icons.visibility,
                color: Color.fromRGBO(77,0,114,1),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )

      ),
    );
    final loginButton = Material(
      elevation: 0.0,
      borderRadius: BorderRadius.circular(10),
      color: Color.fromRGBO(8,47,72,1),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(10,15,10,15),
        minWidth: MediaQuery.of(context).size.width,
        splashColor: Colors.black.withOpacity(0.2),
        onPressed:(){

          if((emailcontroller.text=='jashwanthkumar.ad21@bitsathy.ac.in') && (passwordcontroller.text=='123456')){
            Fluttertoast.showToast(msg: "Welcome ADMIN");
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>adminhome()));
          }
          else {
            signIn(emailcontroller.text, passwordcontroller.text);
          }
        } ,
        child: Text("Login",textAlign: TextAlign.center,
        style:TextStyle(fontSize: 15,fontFamily:'Arimo',color: Colors.white,fontWeight: FontWeight.bold) ,
        ),
      ),

    );
    return Scaffold(
backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
            child:Padding(
              padding: const EdgeInsets.all(36.0),
            child: Form(
              key: _formkey ,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      height: 250,
                      child: Image.asset("assets/bitlogo.png",
                      fit: BoxFit.contain,
                      )),
                  SizedBox(height: 25),
                  Text("Enter Your Bitsathy Account",style: TextStyle(fontSize: 17,fontFamily: 'Arimo',fontWeight: FontWeight.bold,color:Color.fromRGBO(8,47,72,1), ),),
                  SizedBox(height: 25),
                  emailField,
                  SizedBox(height: 25),
                  passwordField,
                  SizedBox(height: 35),
                  loginButton,
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Don't have an account?",style: TextStyle(fontFamily:'Arimo',fontWeight:FontWeight.w900)),
                      GestureDetector(onTap: (){

                        Navigator.push(context, MaterialPageRoute(builder: (context)=>registrationscreen()));
                      },
                      child: Text(" SignUp",

                          style: TextStyle(color:Colors.blue[800],fontFamily:'Arimo',fontWeight: FontWeight.bold,fontSize: 14)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),

        ),
        ),


    );
  }
  void _toggleview(){
    setState(() {
      _isHidden=!_isHidden;
    });
  }
  void signIn(String email,String password) async
  {
    if(_formkey.currentState!.validate()){
      await _auth.signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
            Fluttertoast.showToast(msg: "Login successful"),
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Homescreen()))

      }).catchError((e)
      {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

}
