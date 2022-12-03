import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart' as db;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newlogin/model/user_model.dart' ;
import 'package:newlogin/screens/responsescrn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class detailsentry extends StatefulWidget {
  const detailsentry({Key? key}) : super(key: key);

  @override
  State<detailsentry> createState() => _detailsentryState();
}

class _detailsentryState extends State<detailsentry> {

  final  usernofsController = TextEditingController();
  final  userfromdateController= TextEditingController();
  final  usertodateController =TextEditingController();
  final userdescController = TextEditingController();
  final _formkey= GlobalKey<FormState>();
  final User? user=FirebaseAuth.instance.currentUser;
  DateTime dateTime = DateTime(2022,11,30,8,45);
  TimeOfDay time=TimeOfDay(hour: 12, minute: 00);
  late db.DatabaseReference dbRef;
  TextEditingController timeinput=TextEditingController();
  TextEditingController timeinput2=TextEditingController();
  UserModel loggedinuser=UserModel();
  @override
  void initState() {
    timeinput.text="";
    timeinput2.text="";
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedinuser = UserModel.fromMap(value.data());
      setState(() {
      });
    });
    dbRef = db.FirebaseDatabase.instance.ref().child('REQUEST');
  }
  @override
  db.Query dbRef2 = db.FirebaseDatabase.instance.ref().child('IBCLASS');
  Widget listItem({required Map request}) {
    return Center(
      child:SingleChildScrollView(
        child:Container(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child:Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      autofocus: false,
                      controller: usernofsController,
                      style: TextStyle(fontFamily: 'Arimo'),
                      keyboardType: TextInputType.number,
                      validator: (value){
                        if(value!.isEmpty){
                          return("Please enter total no. of. students");
                        }
                        return null;
                      },
                      onSaved: (value)
                      {
                        usernofsController.text=value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          prefixIcon:Icon(Icons.person,color: Color.fromRGBO(77,0,114,1),),
                          contentPadding: EdgeInsets.fromLTRB(20,15,20,15),
                          hintText: "No. of. students",
                          hintStyle: TextStyle(fontFamily: 'Arimo'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )

                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: userfromdateController,
                      autofocus: false,
                      style: TextStyle(fontFamily: 'Arimo'),
                      onTap: ()async {
                        DateTime ? pickdate2 = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2050));
                        if (pickdate2 != null) {
                          setState(() {
                            userfromdateController.text =
                                DateFormat('dd-MM-yyyy').format(pickdate2);
                          });
                        };
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return("Please select FROM date");
                        }

                        return null;
                      },
                      onSaved: (value)
                      {

                        userfromdateController.text=value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          prefixIcon:Icon(Icons.date_range,color: Color.fromRGBO(77,0,114,1),),
                          contentPadding: EdgeInsets.fromLTRB(20,15,20,15),

                          hintText: "FROM",
                          hintStyle: TextStyle(fontFamily: 'Arimo'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )

                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: usertodateController,
                      keyboardType: TextInputType.phone,
                      style: TextStyle(fontFamily: 'Arimo'),
                      onTap: ()async {
                        DateTime ? pickdate2 = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2050));
                        if (pickdate2 != null) {
                          setState(() {
                            usertodateController.text =
                                DateFormat('dd-MM-yyyy').format(pickdate2);
                          });
                        };
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return("Please select TO date");
                        }
                        return null;
                      },
                      onSaved: (value)
                      {
                        usertodateController.text=value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          prefixIcon:Icon(Icons.date_range,color: Color.fromRGBO(77,0,114,1),),
                          contentPadding: EdgeInsets.fromLTRB(20,15,20,15),
                          hintText: "TO",
                          hintStyle: TextStyle(fontFamily: 'Arimo'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )

                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      autofocus: false,
                      controller: timeinput,
                      style: TextStyle(fontFamily: 'Arimo',),
                      keyboardType: TextInputType.number,
                      onTap: () async {
                        TimeOfDay ? picktime2= await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay(hour: time.hour, minute: time.minute));
                        if(picktime2!=null) {
                          DateTime parsedtime=DateFormat.jm().parse(picktime2.format(context).toString());
                          String formattedtime= DateFormat('HH:mm').format(parsedtime);
                          setState(() {
                            timeinput.text=formattedtime;
                          });
                        }
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return("Please select FROM time");
                        }
                        return null;
                      },
                      onSaved: (value)
                      {
                        timeinput.text=value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20,15,20,15),
                          prefixIcon: Icon(Icons.access_time,color: Color.fromRGBO(77,0,114,1),),
                          suffixIcon: Icon(Icons.arrow_drop_down,color: Color.fromRGBO(77,0,114,1),),
                          hintText: "FROM time",
                          hintStyle: TextStyle(fontFamily: 'Arimo',),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      autofocus: false,
                      controller: timeinput2,
                      style: TextStyle(fontFamily: 'Arimo',),
                      keyboardType: TextInputType.number,
                      onTap: () async {
                        TimeOfDay ? picktime= await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay(hour: time.hour, minute: time.minute));
                        if(picktime!=null)
                        {
                          DateTime parsedtime=DateFormat.jm().parse(picktime.format(context).toString());
                          String formattedtime= DateFormat('HH:mm').format(parsedtime);
                          setState(() {
                            timeinput2.text=formattedtime;
                          });
                        }
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return("Please select TO time");
                        }
                        return null;
                      },
                      onSaved: (value)
                      {
                        timeinput2.text=value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20,15,20,15),
                          prefixIcon: Icon(Icons.access_time,color: Color.fromRGBO(77,0,114,1),),
                          suffixIcon: Icon(Icons.arrow_drop_down,color: Color.fromRGBO(77,0,114,1),),
                          hintText: "TO time",
                          hintStyle: TextStyle(fontFamily: 'Arimo',),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      maxLines: null,
                      autofocus: false,
                      controller: userdescController,
                      style: TextStyle(fontFamily: 'Arimo'),
                      keyboardType: TextInputType.text,

                      validator: (value){
                        if(value!.isEmpty){
                          return("Please enter description");
                        }
                        return null;
                      },
                      onSaved: (value)
                      {
                        userdescController.text=value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          prefixIcon:Icon(Icons.description,color: Color.fromRGBO(77,0,114,1),),
                          contentPadding: EdgeInsets.fromLTRB(10,15,10,50),
                          hintText: "Description of the event",
                          hintStyle: TextStyle(fontFamily: 'Arimo'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )

                      ),
                    ),

                    SizedBox(height: 100,),
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(8,47,72,1),
                      child:MaterialButton(
                        padding: EdgeInsets.fromLTRB(20,15,20,15),
                        minWidth: MediaQuery.of(context).size.width,
                        splashColor: Colors.black.withOpacity(0.2),
                        onPressed: () {
                          savedetails(usernofsController.text, userfromdateController.text, usertodateController.text,userdescController.text);
                        },
                        child: Text("REQUEST VENUE",textAlign: TextAlign.center,
                          style:TextStyle(fontSize: 15,fontFamily: 'Arimo',color: Colors.white,fontWeight: FontWeight.bold) ,
                        ),

                      ),
                    ),
                  ],
                ),
              ),

            )
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
final hours = dateTime.hour.toString().padLeft(2,'0');
final minutes = dateTime.minute.toString().padLeft(2,'0');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("DETAILS",style: TextStyle(fontFamily: 'Arimo',color: Colors.white,fontSize:15,fontWeight: FontWeight.bold),),
        centerTitle: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),),),
      ),
      body: FirebaseAnimatedList(
        query: dbRef2,
        itemBuilder: (BuildContext context, db.DataSnapshot snapshot, Animation<double> animation, int index) {

          Map request = snapshot.value as Map;
          request['key'] = snapshot.key;

          return listItem(request: request);
        },
      ),
    );

  }
  void savedetails(String noofstudents,String fromdate,String todate,String description) async
  {
    if(_formkey.currentState!.validate()) {
      passDetailtoFirestore();
    }
  }
  passDetailtoFirestore() async{
    Map<String, String> REQUEST = {
    'FACULTY NAME':loggedinuser.firstname.toString(),
    'LAST NAME':loggedinuser.lastname.toString(),
    'NO OF STUDENTS': usernofsController.text,
    'FROM DATE': userfromdateController.text,
    'TO DATE': usertodateController.text,
    'FROM TIME':timeinput.text,
    'TO TIME':timeinput2.text,
    'DESCRIPTION': userdescController.text,
    };
    dbRef.push().set(REQUEST);
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>response()));
  }
  String currrentuser(){
    final User user = FirebaseAuth.instance.currentUser!;
    final uid = user.uid.toString();
    return uid;
  }
}