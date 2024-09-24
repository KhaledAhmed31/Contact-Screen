import 'package:add_contact/contact_card.dart';
import 'package:add_contact/text_field.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const String routeName = 'Home Screen';
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> nameKey = GlobalKey();
  final GlobalKey<FormState> phoneKey = GlobalKey();

  static List<ContactCard> cards = [
    ContactCard(name: '', phone: 0, onPressed: () {}),
    ContactCard(name: '', phone: 0, onPressed: () {}),
    ContactCard(name: '', phone: 0, onPressed: () {})
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'Contact Screen',
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Form(
                  key: nameKey,
                  child: MyTextField(
                      hint: "username", controller: nameController)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Form(
                  key: phoneKey,
                  child:
                      MyTextField(hint: "Phone", controller: phoneController)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            backgroundColor:
                                const Color.fromARGB(255, 29, 137, 225)),
                        onPressed: () {
                          if (nameKey.currentState!.validate() &&
                              phoneKey.currentState!.validate()) {
                            setState(() {
                              for (int i = 0; i < 3; ++i) {
                                if (cards[i].name == '') {
                                  cards[i] = ContactCard(
                                    name: nameController.text,
                                    phone: int.parse(phoneController.text),
                                    onPressed: () {
                                      setState(() {
                                        deleteContact(i);
                                      });
                                    },
                                  );
                                  break;
                                }
                              }
                              nameController.clear();
                              phoneController.clear();
                            });
                          }
                        },
                        child: const Text(
                          'Add',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: cards.length,
              itemBuilder: (context, i) {
                return cards[i];
              },
            ))
          ],
        ),
      ),
    );
  }

  void addContact() {
    for (int i = 0; i < 3; ++i) {
      if (cards[i].name == '') {
        cards[i] = ContactCard(
          name: nameController.text,
          phone: int.parse(phoneController.text),
          onPressed: () {
            setState(() {});
          },
        );
      }
    }
  }

  void deleteContact(int index) {
    cards[index]
      ..name = ''
      ..phone = 0
      ..onPressed = () {};
  }
}
