

import 'package:whatsapp_clone_/common/enums/enums.dart';

class MessageModel {
  final String senderId;
  final String recieverid;
  final String text;
  final MessageEnum type;
  final DateTime timeSent;
  final String messageId;


  MessageModel({
    required this.senderId,
    required this.recieverid,
    required this.text,
    required this.type,
    required this.timeSent,
    required this.messageId,
   
  });

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'recieverid': recieverid,
      'text': text,
      'type': type,
      'timeSent': timeSent.millisecondsSinceEpoch,
      'messageId': messageId,
      
      
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      senderId: map['senderId'] ?? '',
      recieverid: map['recieverid'] ?? '',
      text: map['text'] ?? '',
      type: (map['type'] as String).toEnum(),
      timeSent: DateTime.fromMillisecondsSinceEpoch(map['timeSent']),
      messageId: map['messageId'] ?? '',
     
    );
  }
}
