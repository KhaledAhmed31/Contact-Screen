import 'package:add_contact/home.dart';
import 'package:flutter/material.dart';

typedef OnPressedFunction = void Function();

// ignore: must_be_immutable
class ContactCard extends StatelessWidget {
  String name;
  int phone;
  OnPressedFunction onPressed;

  ContactCard(
      {super.key,
      required this.name,
      required this.phone,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: name.isNotEmpty,
      child: Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(vertical: 15),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(40)),
        child: Row(
          children: [
            Expanded(
              child: Text(
                '''Name: $name
Phone: $phone''',
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 30,
                ))
          ],
        ),
      ),
    );
  }

  void deleteContact(String name) {
    for (int i = 0; i < 3; ++i) {
      if (HomeState.cards[i].name == name) {
        HomeState.cards[i]
          ..name = ''
          ..phone = 0
          ..onPressed = () {};
        return;
      }
    }
  }
}
