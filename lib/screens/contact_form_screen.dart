import 'dart:math';

import 'package:bytebank_poc/database/dao/contact_dao.dart';
import 'package:bytebank_poc/models/contact.dart';
import 'package:flutter/material.dart';

class ContactFormScreen extends StatefulWidget {
  const ContactFormScreen({super.key});

  @override
  State<ContactFormScreen> createState() => _ContactFormScreenState();
}

class _ContactFormScreenState extends State<ContactFormScreen> {
  @override
  Widget build(BuildContext context) {
    final dao = ContactDao();
    TextEditingController nameController = TextEditingController();
    TextEditingController accountController = TextEditingController();

    return Scaffold(
        appBar: AppBar(title: const Text('New contact')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Full Name'),
                style: const TextStyle(fontSize: 24),
                controller: nameController,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Account Number'),
                style: const TextStyle(fontSize: 24),
                keyboardType: TextInputType.number,
                controller: accountController,
              ),
              const SizedBox(height: 12),
              SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () {
                      final name = nameController.text;
                      final accountNumber = int.tryParse(accountController.text) ?? 0;
                      final newContact = Contact(id: Random().nextInt(1000), name: name, accountNumber: accountNumber);
                      dao.save(newContact).then((_) => Navigator.pop(context));
                    },
                    child: const Text('Create'),
                  ))
            ],
          ),
        ));
  }
}
