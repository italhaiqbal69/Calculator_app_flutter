import 'package:flutter/material.dart';
class Mybutton extends StatefulWidget {
  final String title;
  final Color color;
  final VoidCallback onpress;
  const Mybutton({Key? key , required this.title , this.color = const Color(0xffa5a5a5),
  required this.onpress}) : super(key: key);

  @override
  State<Mybutton> createState() => _MybuttonState();
}

class _MybuttonState extends State<Mybutton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: InkWell(
          onTap: widget.onpress,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.color,
            ),
            child: Center(child: Text(widget.title , style: const TextStyle(fontSize: 20 , color: Colors.white),)),
          ),
        ),
      ),
    );
  }
}
