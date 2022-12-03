import 'package:flutter/material.dart';
import 'package:newlogin/admin/addclass.dart';
import 'package:newlogin/admin/requestscrn.dart';
class adminhome extends StatefulWidget {
  const adminhome({Key? key}) : super(key: key);

  @override
  State<adminhome> createState() => _adminhomeState();
}

class _adminhomeState extends State<adminhome> {
  @override
  Widget build(BuildContext context) {
    final addclass = Material(
      color: Color.fromRGBO(77, 0, 114, 1),
      borderRadius: BorderRadius.circular(10),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(10,15,10,15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>addingclass()));

        },
        child: Column(
          children: [
            SizedBox(height: 6,
            child: Icon(Icons.add_circle,color: Colors.white,size: 70,),
            ),
            SizedBox(height: 70,),
            Text('ADD CLASS',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Arimo',color: Colors.white,fontSize: 17),),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
    final reqbtn = Material(
      color: Color.fromRGBO(77, 0, 114, 1),
      borderRadius: BorderRadius.circular(10),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(10,15,10,15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>approval()));

        },
        child: Column(
          children: [
            SizedBox(height: 6,
              child: Icon(Icons.check_circle_rounded,color: Colors.white,size: 70,),
            ),
            SizedBox(height: 70,),
            Text('ACCEPT/REJECT REQ',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Arimo',color: Colors.white,fontSize: 17),),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("ADMIN",style: TextStyle(fontFamily: 'Arimo',color: Colors.white,fontSize:15,fontWeight: FontWeight.bold),
      ),
        centerTitle: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),),),

      ),
      body:SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          SizedBox(height: 6,),
            addclass,
            SizedBox(height: 20,),
            reqbtn,
        ],
      ),
    ),
      ),
    );
  }
}
