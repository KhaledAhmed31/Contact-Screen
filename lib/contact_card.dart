import 'package:add_contact/home.dart';
import 'package:flutter/material.dart';

typedef OnPressedFunction = void Function();

class ContactCard extends StatefulWidget {
  const ContactCard({
    super.key,
    required this.name,
    required this.phone,
  });
  final String name;
  final int phone;

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  final int index = HomeState.cards.indexOf(const ContactCard(
    name: 'khaled',
    phone: 01207731315,
  ));
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(40)),
      child: Row(
        children: [
          Text(
            '''Name: ${widget.name}
Phone: ${widget.phone}''',
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      (context) {
                        setState(() {
                          if (HomeState.cards.isNotEmpty) {
                            HomeState.cards.removeAt(index);
                            --HomeState.count;
                          }
                        });
                      };
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 30,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
