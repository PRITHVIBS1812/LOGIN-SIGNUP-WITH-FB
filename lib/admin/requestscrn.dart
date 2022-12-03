import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
class approval extends StatefulWidget {
  const approval({Key? key}) : super(key: key);
static const String status ='initiated';
  @override
  State<approval> createState() => _approvalState();
}
class _approvalState extends State<approval> {
  @override
  Query dbRef = FirebaseDatabase.instance.ref().child('REQUEST');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('REQUEST');
  Widget listItem({required Map request}) {
    return SingleChildScrollView(
      child:Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromRGBO(242, 232, 255, 1),
        ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children:[
              Text('Faculty Name:',style: TextStyle(fontSize: 17,fontFamily: 'Arimo',fontWeight: FontWeight.bold),),
              SizedBox(width: 5,),
              Row(
                children:[
              Text(
                request['FACULTY NAME'],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,fontFamily: 'Arimo'),
              ),
                  SizedBox(width: 5,),
                  Text(
                    request['LAST NAME'],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,fontFamily: 'Arimo'),
                  ),
        ],
      ),
            ],
          ),
          SizedBox(height: 5,),
          Row(
            children:[
              Text('Number of students:',style: TextStyle(fontSize: 17,fontFamily: 'Arimo',fontWeight: FontWeight.bold),),
              SizedBox(width: 5,),
          Text(
            request['NO OF STUDENTS'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,fontFamily: 'Arimo'),
          ),
        ],
      ),
          SizedBox(
            height: 5,
          ),
      Row(
        children:[
          Text('From date:',style: TextStyle(fontSize: 17,fontFamily: 'Arimo',fontWeight: FontWeight.bold),),
        SizedBox(width: 5,),
        Row(
          children:[
        Text(
            request['FROM DATE'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,fontFamily: 'Arimo'),
          ),
            SizedBox(width: 5,),
            Text(
              request['FROM TIME'],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900,fontFamily: 'Arimo',),
            ),
            ],
        ),
      ],
      ),
          SizedBox(
            height: 5,
          ),
          Row(
            children:[
              Text('To date:',style: TextStyle(fontSize: 17,fontFamily: 'Arimo',fontWeight: FontWeight.bold),),
          SizedBox(width: 5,),
          Row(
            children:[
          Text(
            request['TO DATE'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,fontFamily: 'Arimo'),
          ), SizedBox(width: 5,),
              Text(
                request['TO TIME'],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900,fontFamily: 'Arimo'),
              ),
              ],
          ),
      ],
    ),
          SizedBox(height: 5,),
          Row(
            children:[
              Text('Description:',style: TextStyle(fontSize: 17,fontFamily: 'Arimo',fontWeight: FontWeight.bold),),
         SizedBox(width: 5,),
         Flexible(
           child:
         Text(
            request['DESCRIPTION'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,fontFamily: 'Arimo'),
          ),
         ),
      ],
    ),
          SizedBox(height: 5,),
              Row(
              children:[
                Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(30),
                color: Color.fromRGBO(0,136,34,1),
                child:MaterialButton(
                padding: EdgeInsets.fromLTRB(20,15,20,15),
                splashColor: Colors.black.withOpacity(0.2),
                onPressed: () {
                },
                child: Text("ACCEPT",textAlign: TextAlign.center,
                  style:TextStyle(fontSize: 15,fontFamily: 'Arimo',color: Colors.white,fontWeight: FontWeight.bold) ,
                ),
              ),
                ),
        SizedBox(width: 10,),
        Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(30),
          color: Color.fromRGBO(255,0,0,1),
          child:
        MaterialButton(
          padding: EdgeInsets.fromLTRB(20,15,20,15),
          splashColor: Colors.black.withOpacity(0.2),
          onPressed: () {

          },
          child: Text("REJECT",textAlign: TextAlign.center,
            style:TextStyle(fontSize: 15,fontFamily: 'Arimo',color: Colors.white,fontWeight: FontWeight.bold) ,
          ),
        ),
        ),
        ],
      ),
        ],
      ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text("APPROVAL",style: TextStyle(fontFamily: 'Arimo',color: Colors.white,fontSize:15,fontWeight: FontWeight.bold),),
          centerTitle: true,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),),),
        ),
        body: Container(
          height: double.infinity,
          child: FirebaseAnimatedList(
            query: dbRef,
            itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {

              Map request = snapshot.value as Map;
              request['key'] = snapshot.key;

              return listItem(request: request);
            },
          ),
        )
    );
  }
}
