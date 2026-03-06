import 'package:bytebank_poc/database/dao/contact_dao.dart';
import 'package:bytebank_poc/models/contact.dart';
import 'package:bytebank_poc/screens/contact_form_screen.dart';
import 'package:bytebank_poc/widgets/contact_item.dart';
import 'package:flutter/material.dart';

class ContactsListScreen extends StatefulWidget {
  const ContactsListScreen({super.key});

  @override
  State<ContactsListScreen> createState() => _ContactsListScreenState();
}

class _ContactsListScreenState extends State<ContactsListScreen> {
  final _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contacts')),
      body: FutureBuilder(
        future: _dao.findAll(),
        builder: (context, snapshot) {
          final List<Contact> contacts = snapshot.data ?? [];
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                child: TextButton(
                  onPressed: () => _dao.findAll(),
                  child: const Text('Clique para buscar contatos'),
                ),
              );
            case ConnectionState.waiting:
            case ConnectionState.active:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (contacts.isEmpty) return const Center(child: Text('Cadastre um contato para exibir'));
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ContactItem(contact: contacts[index]);
                },
                itemCount: contacts.length,
              );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ContactFormScreen())),
          setState(() {}),
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
