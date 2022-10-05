import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:whatsapp_clone_/common/utils/colors.dart';
import 'package:whatsapp_clone_/common/widgets/loader.dart';
import 'package:whatsapp_clone_/features/auth/controller/auth_provider.dart';
import 'package:whatsapp_clone_/features/chats/widgets/chat_input_txtfield.dart';
import 'package:whatsapp_clone_/features/chats/widgets/chat_messages.dart';
import 'package:whatsapp_clone_/models/user_model.dart';

class ChatScreen extends ConsumerWidget {
  static const String routeName = '/chat-screen';
  const ChatScreen({
    Key? key,
    required this.name,
    required this.uid,
    required this.isGroupChat,
    required this.profilePic,
  }) : super(key: key);

  final String name;
  final String uid;
  final bool isGroupChat;
  final String profilePic;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: StreamBuilder<UserModel>(
            stream: ref.read(authControllerProvider).userDataById(uid),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Loader();
              }
              return Column(
                children: [
                  const Text("name"),
                  Text(
                    snapshot.data!.isOnline ? 'online' : 'offline',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              );
            }),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.video_call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ChatList(
              recieverUserId: uid,
            ),
          ),
          ChatFieldTxtField(
            recieverUserId: uid,
            isGroupChat: isGroupChat,
          ),
        ],
      ),
    );
  }
}
