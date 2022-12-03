import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:newlogin/screens/detailsscreen.dart';
 class sfBlock extends StatefulWidget {
   const sfBlock({Key? key}) : super(key: key);

   @override
   State<sfBlock> createState() => _sfBlockState();
 }

 class _sfBlockState extends State<sfBlock> {
   @override
   Query dbRef = FirebaseDatabase.instance.ref().child('SFCLASS');
   Widget listItem({required Map request}) {
     return SingleChildScrollView(
       child:Padding(
         padding: EdgeInsets.only(left:20,top:6,right: 20,bottom: 6),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
             if(request['CLASS-TYPE']=='Classroom')
               sfclass(request['CLASS-NAME'], request['STRENGTH'], request['SPEAKER-PROJECTOR'], request['AC']),
             if(request['CLASS-TYPE']=='Seminar Hall')
               semhall(request['CLASS-NAME'], request['STRENGTH'], request['SPEAKER-PROJECTOR'], request['AC']),
             if(request['CLASS-TYPE']=='Lab')
               lab(request['CLASS-NAME'],request['STRENGTH'] ,request['SPEAKER-PROJECTOR'], request['AC']),
           ],
         ),
       ),
     );
   }
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.white,
       appBar: AppBar(title: Text("SF BLOCK",style: TextStyle(fontFamily: 'Arimo',color: Colors.white,fontSize:15,fontWeight: FontWeight.bold),),
         centerTitle: true,
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),),),
       ),

       body: FirebaseAnimatedList(
         query: dbRef,
         itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {

           Map request = snapshot.value as Map;
           request['key'] = snapshot.key;

           return listItem(request: request);
         },
       ),
     );
   }
   Material sfclass(String classnum,String strength,String speakerAndprojector,String ac) {
     return Material(
       elevation: 4,
       color: Colors.white,
       borderRadius: BorderRadius.circular(10),
       child: MaterialButton(
         padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
         minWidth: MediaQuery
             .of(context)
             .size
             .width,
         onPressed: () {
           Navigator.push(
               context, MaterialPageRoute(builder: (context) => detailsentry()));
         },
         child: Row(
           children: [
             SizedBox(height: 100,width: 150,
               child: Image.asset('assets/classimg.png',),
             ),
             SizedBox(width: 5,),
             Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(classnum, style: TextStyle(fontWeight: FontWeight.w900,
                     fontFamily: 'Arimo',
                     color: Colors.black,
                     fontSize: 15),),

                 SizedBox(height: 5,),
                 Row(
                   children: [
                     Text('Strength:', style: TextStyle(
                         fontWeight: FontWeight.normal,
                         fontFamily: 'Arimo',
                         color: Colors.black,
                         fontSize: 10),),
                     SizedBox(width: 5,),
                     Text(strength, style: TextStyle(
                         fontWeight: FontWeight.normal,
                         fontFamily: 'Arimo',
                         color: Colors.black,
                         fontSize: 10),),
                   ],
                 ),
                 SizedBox(height: 5,),
                 Row(
                   children: [
                     Text('Speaker/projector:', style: TextStyle(
                         fontWeight: FontWeight.normal,
                         fontFamily: 'Arimo',
                         color: Colors.black,
                         fontSize: 10),),
                     SizedBox(width: 5,),
                     Text(speakerAndprojector, style: TextStyle(
                         fontWeight: FontWeight.normal,
                         fontFamily: 'Arimo',
                         color: Colors.black,
                         fontSize: 10),),
                   ],
                 ),
                 SizedBox(height: 5,),
                 Row(
                   children: [
                     Text('AC:', style: TextStyle(fontWeight: FontWeight.normal,
                         fontFamily: 'Arimo',
                         color: Colors.black,
                         fontSize: 10),),
                     SizedBox(width: 5,),
                     Text(ac, style: TextStyle(fontWeight: FontWeight.normal,
                         fontFamily: 'Arimo',
                         color: Colors.black,
                         fontSize: 10),),
                   ],
                 ),
               ],
             ),
           ],
         ),
       ),
     );
   }
   Material semhall(String classnum1,String strength1,String speakerAndprojector1,String ac1) {
     return Material(
       elevation: 4,
       color: Colors.white,
       borderRadius: BorderRadius.circular(10),
       child: MaterialButton(
         padding: EdgeInsets.fromLTRB(10,15,10,15),
         minWidth: MediaQuery.of(context).size.width,
         onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>detailsentry()));
         },
         child: Row(
           children: [
             SizedBox(height: 100,width: 150,
               child: Image.asset('assets/seminarhall.png',),
             ),
             SizedBox(width: 5,),
             Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children:[
                 Text(classnum1,maxLines:2,style: TextStyle(fontWeight: FontWeight.w900,fontFamily: 'Arimo',color: Colors.black,fontSize: 15),),

                 SizedBox(height: 5,),
                 Row(
                   children:[
                     Text('Strength:',style: TextStyle(fontWeight: FontWeight.normal,fontFamily: 'Arimo',color: Colors.black,fontSize: 10),),
                     SizedBox(width: 5,),
                     Text(strength1,style: TextStyle(fontWeight: FontWeight.normal,fontFamily: 'Arimo',color: Colors.black,fontSize: 10),),
                   ],
                 ),
                 SizedBox(height: 5,),
                 Row(
                   children:[
                     Text('Speaker/projector:',style: TextStyle(fontWeight: FontWeight.normal,fontFamily: 'Arimo',color: Colors.black,fontSize: 10),),
                     SizedBox(width: 5,),
                     Text(speakerAndprojector1,style: TextStyle(fontWeight: FontWeight.normal,fontFamily: 'Arimo',color: Colors.black,fontSize: 10),),
                   ],
                 ),
                 SizedBox(height: 5,),
                 Row(
                   children:[
                     Text('AC:',style: TextStyle(fontWeight: FontWeight.normal,fontFamily: 'Arimo',color: Colors.black,fontSize: 10),),
                     SizedBox(width: 5,),
                     Text(ac1,style: TextStyle(fontWeight: FontWeight.normal,fontFamily: 'Arimo',color: Colors.black,fontSize: 10),),
                   ],
                 ),
               ],
             ),
           ],
         ),
       ),
     );
   }
   Material lab(String classnum2,String strength2,String speakerAndprojector2,String ac2) {
     return Material(
       elevation: 4,
       color: Colors.white,
       borderRadius: BorderRadius.circular(10),
       child: MaterialButton(
         padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
         minWidth: MediaQuery
             .of(context)
             .size
             .width,
         onPressed: () {
           Navigator.push(
               context, MaterialPageRoute(builder: (context) => detailsentry()));
         },
         child: Row(
           children: [
             SizedBox(height: 100,width: 150,
               child: Image.asset('assets/lab.png',),
             ),
             SizedBox(width: 5,),
             Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(classnum2, style: TextStyle(fontWeight: FontWeight.w900,
                     fontFamily: 'Arimo',
                     color: Colors.black,
                     fontSize: 15),),

                 SizedBox(height: 5,),
                 Row(
                   children: [
                     Text('Strength:', style: TextStyle(
                         fontWeight: FontWeight.normal,
                         fontFamily: 'Arimo',
                         color: Colors.black,
                         fontSize: 10),),
                     SizedBox(width: 5,),
                     Text(strength2, style: TextStyle(
                         fontWeight: FontWeight.normal,
                         fontFamily: 'Arimo',
                         color: Colors.black,
                         fontSize: 10),),
                   ],
                 ),
                 SizedBox(height: 5,),
                 Row(
                   children: [
                     Text('Speaker/projector:', style: TextStyle(
                         fontWeight: FontWeight.normal,
                         fontFamily: 'Arimo',
                         color: Colors.black,
                         fontSize: 10),),
                     SizedBox(width: 5,),
                     Text(speakerAndprojector2, style: TextStyle(
                         fontWeight: FontWeight.normal,
                         fontFamily: 'Arimo',
                         color: Colors.black,
                         fontSize: 10),),
                   ],
                 ),
                 SizedBox(height: 5,),
                 Row(
                   children: [
                     Text('AC:', style: TextStyle(fontWeight: FontWeight.normal,
                         fontFamily: 'Arimo',
                         color: Colors.black,
                         fontSize: 10),),
                     SizedBox(width: 5,),
                     Text(ac2, style: TextStyle(fontWeight: FontWeight.normal,
                         fontFamily: 'Arimo',
                         color: Colors.black,
                         fontSize: 10),),
                   ],
                 ),
               ],
             ),
           ],
         ),
       ),
     );
   }
 }
