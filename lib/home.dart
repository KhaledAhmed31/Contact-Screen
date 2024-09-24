import 'package:add_contact/contact_card.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const String routeName = 'Home Screen';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  bool card1IsVisiable = false;
  bool card2IsVisiable = false;
  bool card3IsVisiable = false;
  int count = 0;
  List<ContactCard> cards = [
    const ContactCard(name: '', phone: 0),
    const ContactCard(name: '', phone: 0),
    const ContactCard(name: '', phone: 0),
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
              child: TextField(
                cursorColor: Colors.blue,
                controller: nameController,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.blue)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.blue)),
                    hintText: 'Enter Your Name Here',
                    suffixIcon: const Icon(
                      size: 23,
                      Icons.edit,
                      color: Colors.blue,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextField(
                cursorColor: Colors.blue,
                controller: phoneController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.blue)),
                    focusColor: Colors.blue,
                    hintText: 'Enter Your Number Here',
                    suffixIcon: const Icon(
                      size: 23,
                      Icons.phone,
                      color: Colors.blue,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(30)))),
              ),
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
                          setState(() {
                            if (count <= 2) {
                              cards[count] = ContactCard(
                                name: nameController.text,
                                phone: int.parse(phoneController.text),
                              );
                              nameController.clear();
                              phoneController.clear();
                              ++count;
                            }
                          });
                        },
                        child: const Text(
                          'Add',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            backgroundColor:
                                const Color.fromARGB(255, 255, 71, 77)),
                        onPressed: () {
                          setState(() {
                            if (count > 0) {
                              cards[count - 1] =
                                  const ContactCard(name: '', phone: 0);
                              --count;
                            }
                          });
                        },
                        child: const Text('Delete',
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                                fontWeight: FontWeight.w600))),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Visibility(visible: cards[2].name != '', child: cards[2]),
                    Visibility(visible: cards[1].name != '', child: cards[1]),
                    Visibility(visible: cards[0].name != '', child: cards[0]),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
