import 'package:bytebank_poc/screens/contacts_list_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Dashboard"),),
        body: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/bytebank_logo.png'),
              InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactsListScreen())),
                child: Container(
                  color: Theme.of(context).primaryColor,
                  width: 150,
                  height: 100,
                  child: const Padding(
                    padding:  EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.group, color: Colors.white),
                        Text('Contacts', style: TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),

      );
  }
}