import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomField extends StatelessWidget {
  final String? hint;
  final Function()? validate;
  IconData? icon;
  EdgeInsetsGeometry? padding;
  int? maxLins;
  final TextEditingController? controller;
  CustomField(
      {Key? key,
      this.hint,
      this.validate,
      this.controller,
      this.icon,
      this.padding,
      this.maxLins})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      // height: 35,
      child: TextFormField(
          style: const TextStyle(color: Colors.black),
          maxLines: maxLins ?? 1,
          controller: controller,
          decoration: InputDecoration(
            // prefixIcon: Icon(this.icon!,size: 18,),

            isDense: true,
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade800),
            filled: true,
            fillColor: Colors.transparent,
            contentPadding: padding!,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.grey.shade300, width: 0)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.grey.shade300, width: 0)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.grey.shade300, width: 0)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide:
                    BorderSide(color: Colors.grey.shade300, width: 0.5)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide:
                    BorderSide(color: Colors.grey.shade300, width: 0.5)),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Field Required";
            }
            return "";
          }),
    );
  }
}
