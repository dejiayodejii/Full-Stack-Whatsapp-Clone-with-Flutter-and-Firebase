import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone_/features/auth/controller/auth_provider.dart';
import 'package:whatsapp_clone_/features/chats/repository/chat_repository.dart';
import 'package:whatsapp_clone_/models/message_model.dart';
import 'package:whatsapp_clone_/models/recent_chat.dart';

final chatControllerProvider = Provider((ref) {
  final chatRepository = ref.watch(chatRepositoryProvider);
  return ChatController(
    chatRepository: chatRepository,
    ref: ref,
  );
});

class ChatController {
  final ChatRepository chatRepository;
  final ProviderRef ref;
  ChatController({
    required this.chatRepository,
    required this.ref,
  });

  Stream<List<RecentChat>> chatContacts() {
    return chatRepository.getRecentChat();
  }

  Stream<List<MessageModel>> chatStream(String recieverUserId) {
    return chatRepository.getChatMessageStream(recieverUserId);
  }

  void sendTextMessage(
    BuildContext context,
    String text,
    String recieverUserId,
  ) {
    ref.read(userDataAuthProvider).whenData(
          (value) => chatRepository.sendMessage(
            context: context,
            text: text,
            recieverUserId: recieverUserId,
            senderUser: value!,
          ),
        );
  }
}
