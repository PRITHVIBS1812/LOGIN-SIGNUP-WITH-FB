import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final Function()? onTap;
  final String? btnText;
  final Color? firstColor;
  final Color? secondColor;

  CustomButton({
    required this.onTap,
    this.btnText='IB BLOCK',
    this.firstColor=Colors.deepPurple,
    this.secondColor=Colors.deepPurple,



});
  @override
  Widget build(BuildContext context) {

    return Padding(

        padding: const EdgeInsets.symmetric(horizontal:5.0),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10.0),
          splashColor: Colors.blue.withOpacity(0.2),
          child: Ink(
           height: 150 ,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                  colors: [
                    firstColor!,
                    secondColor!,

                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                )
            ),
            child: Center(
              child: Text(btnText!,textAlign: TextAlign.center,
                style:  TextStyle(
                  fontFamily: 'Arimo',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),

    );
  }
}
