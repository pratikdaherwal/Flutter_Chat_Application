import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ourmessenger/pages/chat_page.dart';
import 'package:ourmessenger/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void signOut() {
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 21, 21),
      appBar: AppBar(
        backgroundColor:  Colors.grey[900],
        title: const Text("Our Messenger",
        style: TextStyle(
          color: Colors.white
        ),
        ),
        actions: [
          IconButton(onPressed: signOut, icon: const Icon(Icons.logout, 
          color: Colors.white,))
        ],
      ),
      
      //backgroundColor: Colors.black,
      body: _buildUserList(),
    );
  }

  // build users list except current user

  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Error");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }
        return ListView(
          children: snapshot.data!.docs
              .map<Widget>((doc) => _buildUserListItem(doc))
              .toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    //display users except current user

    if (_auth.currentUser!.email != data['email']) {
      return ListTile(
        title: Text(data['name'].toString(),
        style: const TextStyle(color: Colors.white),
        ),
        onTap: () {
          //pass uid if user to chatpage
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                recieverUserEmail: data['email'],
                recieverUsedId: data['uid'],
                recieverUserName: data['name'],
              ),
            ),
          );
        },
      );
    }
    return Container();
  }
}