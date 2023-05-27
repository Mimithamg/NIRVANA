import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media/introduction_animation/main_screens/text_box.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // User
  final currentUser = FirebaseAuth.instance.currentUser;

  // All users
  final userCollection = FirebaseFirestore.instance.collection("users");

  late Map<String, dynamic> userData = {}; // Declare the userData variable

  // Edit field
  Future<void> editField(String field) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text(
          "Edit $field",
          style: const TextStyle(color: Colors.white),
        ),
        content: TextField(
          autofocus: true,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Enter new $field",
            hintStyle: TextStyle(color: Colors.grey),
          ),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          // Cancel button
          TextButton(
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.pop(context),
          ),

          // Save button
          TextButton(
            child: Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              if (newValue.trim().length > 0) {
                // Update the field in Firebase
                await userCollection
                    .doc(currentUser?.email ??
                        '') // Handle null value of currentUser.email
                    .update({field: newValue});

                // Update the value in the local userData map
                setState(() {
                  userData[field] = newValue;
                });

                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.grey[900],
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(currentUser?.email ?? '')
            .snapshots(), // Handle null value of currentUser.email
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = (snapshot.data!.data() as Map<String, dynamic>)
                .cast<String, dynamic>();

            return ListView(
              children: [
                const SizedBox(
                  height: 50,
                ),
                // Profile pic
                Icon(
                  Icons.person,
                  size: 72,
                ),
                SizedBox(
                  height: 20,
                ),

                // User email
                Text(
                  currentUser?.email ??
                      '', // Handle null value of currentUser.email
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 50,
                ),
                // User details
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    'My Details',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),

                // Username
                MyTextBox(
                  text: userData["username"],
                  sectionName: 'username',
                  onPressed: () => editField('username'),
                ),

                // Bio
                MyTextBox(
                  text: userData['bio'],
                  sectionName: 'bio',
                  onPressed: () => editField('bio'),
                ),

                // Hobby// Hobby
                MyTextBox(
                  text: userData['hobby'] ??
                      '', // Provide a default value if userData['hobby'] is null
                  sectionName: 'hobby',
                  onPressed: () => editField('hobby'),
                ),

                // User post
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
