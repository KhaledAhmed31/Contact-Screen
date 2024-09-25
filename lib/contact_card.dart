import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ContactCard extends StatefulWidget {
  String name;
  int phone;

  ContactCard({
    super.key,
    required this.name,
    required this.phone,
  });

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.name.isNotEmpty,
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
                '''Name: ${widget.name}
Phone: ${widget.phone}''',
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    widget.name = '';
                    widget.phone = 0;
                  });
                },
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
}
