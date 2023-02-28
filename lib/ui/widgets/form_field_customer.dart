
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef Validator = String? Function(String?);
class FormFieldCustomer extends StatelessWidget{
  TextEditingController? controller;
  String label, hint;
  TextInputType keyboardType;
  bool hideText;
  Validator? validator;


   FormFieldCustomer({ required this.label ,required this.hint ,
     this.validator , this.controller , this.keyboardType = TextInputType.text,
     this.hideText = false }) ;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: [
        Text(label ,style: Theme.of(context).textTheme.headline1
        ),
        SizedBox(height: 8,),
        TextFormField(
          validator: validator,
          controller: controller,
          keyboardType: keyboardType,
          obscureText: hideText,
          decoration: InputDecoration(hintText: hint,
          fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15)
            )
          ),
        ),
        SizedBox(height: 10,)
      ],
    );
  }
}
