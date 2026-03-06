import 'package:bytebank_poc/models/contact.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final Contact? contact;
  const ContactItem({super.key, this.contact});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact?.name ?? '',
        ),
        subtitle: Text(
          '${contact?.accountNumber}',
          style: const TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}
