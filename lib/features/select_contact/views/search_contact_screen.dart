import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone_/features/select_contact/controller/contact_controller.dart';

class CustomSearchDelegate extends SearchDelegate {
  final List<Contact> contactList;
  final WidgetRef ref;
  final BuildContext context;

  CustomSearchDelegate(this.contactList, this.ref, this.context);

// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<Contact> matchQuery = [];
    for (var contact in contactList) {
      if (contact.displayName.contains(query.toLowerCase())) {
        matchQuery.add(contact);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var contact = matchQuery[index];
        return InkWell(
          onTap: (){
            ref
        .read(selectContactControllerProvider)
        .selectContact(contact, context);
          },
          child: ListTile(
            title: Text(
              contact.displayName,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            leading: contact.photo == null
                ? const CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://png.pngitem.com/pimgs/s/649-6490124_katie-notopoulos-katienotopoulos-i-write-about-tech-round.png',
                    ),
                    radius: 20,
                  )
                : CircleAvatar(
                    backgroundImage: MemoryImage(contact.photo!),
                    radius: 30,
                  ),
          ),
        );
      },
    );
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<Contact> matchQuery = [];
    for (var contact in contactList) {
      if (contact.displayName.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(contact);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var contact = matchQuery[index];
        return InkWell(
          onTap:  (){
            ref
        .read(selectContactControllerProvider)
        .selectContact(contact, context);
          },
          child: ListTile(
            title: Text(
              contact.displayName,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            leading: contact.photo == null
                ? const CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://png.pngitem.com/pimgs/s/649-6490124_katie-notopoulos-katienotopoulos-i-write-about-tech-round.png',
                    ),
                    radius: 20,
                  )
                : CircleAvatar(
                    backgroundImage: MemoryImage(contact.photo!),
                    radius: 30,
                  ),
          ),
        );
      },
    );
  }
}
