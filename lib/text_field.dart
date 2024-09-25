import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({super.key, required this.hint, required this.controller});
  final String hint;
  final TextEditingController controller;

  @override
  State<MyTextField> createState() =>
      // ignore: no_logic_in_create_state
      TextFieldState(controller: controller, hint: hint);
}

class TextFieldState extends State<MyTextField> {
  final String hint;
  final TextEditingController controller;

  TextFieldState({required this.hint, required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) return 'Field is empty';
        return null;
      },
      cursorColor: Colors.blue,
      controller: controller,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.blue)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.blue)),
          hintText: hint,
          suffixIcon: const Icon(
            size: 23,
            Icons.edit,
            color: Colors.blue,
          ),
          fillColor: Colors.white,
          filled: true,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)))),
    );
  }
}
