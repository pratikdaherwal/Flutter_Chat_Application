import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ourmessenger/model/messege.dart';

class ChatServices extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // send nudes I mean messeges
  Future<void> sendMessege(String recieverId, String messege) async {
    // get current user info
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

    // create a new messege
    Messege newMessege = Messege(
        senderId: currentUserId,
        senderEmail: currentUserEmail,
        recieverId: recieverId,
        messege: messege,
        timestamp: timestamp);
    // construct chat room id from current userid and recieverid (sorted to ensure uniqueness)
    List<String> ids = [currentUserId, recieverId];
    ids.sort();
    String chatRoomId = ids.join("_");

    // add new messege to database
    await _firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messeges")
        .add(newMessege.toMap());
  }

  // recieve nudes fuck I mean messeges
  Stream<QuerySnapshot> getMesseges(String userId, String otherUserId) {
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");

    return _firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messeges")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
