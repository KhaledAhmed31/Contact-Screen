import 'package:add_contact/contact_card.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const String routeName = 'Home Screen';
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  GlobalKey<FormState> nameKey = GlobalKey();
  GlobalKey<FormState> phoneKey = GlobalKey();
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
  static int count = 0;
  static List<ContactCard> cards = [];

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
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) return 'Name can\'t be empty';
                    return null;
                  },
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
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Form(
                key: phoneKey,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) return 'phone can\'be empty';
                    return null;
                  },
                  keyboardType: TextInputType.number,
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
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)))),
                ),
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
                          if (nameKey.currentState!.validate() &&
                              phoneKey.currentState!.validate()) {
                            setState(() {
                              if (cards.length <= 3) {
                                cards.add(ContactCard(
                                  name: nameController.text,
                                  phone: int.parse(phoneController.text),
                                ));
                                nameController.clear();
                                phoneController.clear();
                                ++count;
                              }
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
                itemBuilder: (BuildContext context, int index) {
                  return cards[index];
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
