import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.name, required this.phone});
  final String name;
  final int phone;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(40)),
      child: Text(
        '''Name: $name
Phone: $phone''',
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontSize: 25,
        ),
      ),
    );
  }
}
