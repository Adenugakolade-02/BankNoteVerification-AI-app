import 'package:flutter/material.dart';


class TextWithFields extends StatelessWidget {
  final String text;
  final String hintText;
  Function onSaved;

  TextWithFields(this.hintText, this.text, @required this.onSaved, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 110,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        Expanded(

          child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
        ),
        const SizedBox(height: 10),
        Expanded(
          flex: 3,
          child: TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(fontSize: 15),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), )
            ),
            onChanged: (_) => onSaved(_),
          ),
        ),

      ]),
      
    );
  }
}