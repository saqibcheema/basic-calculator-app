import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String input; 
  final Color color;
  final VoidCallback onPress;
   const MyButton({super.key,required this.input,required this.onPress,this.color=const Color(0xffa5a5a5)});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: Center(child: Text(input,style: TextStyle(fontSize: 20,color: Colors.white), )),
          ),
        ),
      ),
    );
  }
}
