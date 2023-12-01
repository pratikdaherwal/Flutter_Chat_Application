import 'package:cloud_firestore/cloud_firestore.dart';

class Messege {
  final String senderId;
  final String senderEmail;
  final String recieverId;
  final String messege;
  final Timestamp timestamp;

  Messege({
    required this.senderId,
    required this.senderEmail,
    required this.recieverId,
    required this.messege,
    required this.timestamp,
  });

  //convert to map

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderEmail': senderEmail,
      'recieverId': recieverId,
      'messege': messege,
      'timestamp': timestamp,
    };
  }
}
