import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ourmessenger/components/Text_Field.dart';
import 'package:ourmessenger/components/chat_bubble.dart';
import 'package:ourmessenger/services/chats/chat_services.dart';

class ChatPage extends StatefulWidget {
  final String recieverUserEmail;
  final String recieverUsedId;
  const ChatPage(
      {super.key,
      required this.recieverUserEmail,
      required this.recieverUsedId});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messegeController = TextEditingController();
  final ChatServices _chatServices = ChatServices();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessege() async {
    if (_messegeController.text.isNotEmpty) {
      await _chatServices.sendMessege(
          widget.recieverUsedId, _messegeController.text);
      _messegeController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 21, 21),
      appBar: AppBar(
        backgroundColor:  Colors.grey[900],
        title: Text(widget.recieverUserEmail,
        style: const TextStyle(color: Colors.white)),
      ),
      body: Column(children: [
        Expanded(
          child: _buildMessegeList(),
        ),
        const SizedBox(height: 25,),
        _buildMessegeInput(),
      ]),
    );
  }

  // build messege list
  Widget _buildMessegeList() {
    return StreamBuilder(
        stream: _chatServices.getMesseges(
            widget.recieverUsedId, _firebaseAuth.currentUser!.uid),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading...");
          }
          return ListView(
            children: snapshot.data!.docs
                .map((document) => _buildMessegeItem(document))
                .toList(),
          );
        });
  }

  // build messege item
  Widget _buildMessegeItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    var alingment = (data['senderId'] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Container(
      alignment: alingment,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: 
          (data['senderId'] == _firebaseAuth.currentUser!.uid) 
          ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(data['senderEmail'],
            style: const TextStyle(color: Colors.white)),
            const SizedBox(height: 5,),
            ChatBubble(messege: data['messege']),
          ],
        ),
      ),
    );
  }

  // build messege input
  Widget _buildMessegeInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            child: MyTextField(
              controller: _messegeController,
              hintText: "Write a messege",
              obscureText: false,
              
            ),
          ),
          const SizedBox(width: 7,),
          IconButton(
            onPressed: sendMessege,
            icon: const Icon(
              Icons.arrow_circle_right_outlined,
              size: 65,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
