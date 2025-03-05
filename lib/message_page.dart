import 'package:flutter/material.dart';
import 'package:im_flutter_sdk/im_flutter_sdk.dart';
import 'package:test_oh/item_page.dart';

class MessagePage extends ItemsPage {
  MessagePage({super.key});

  String messageId = ''; // Example message ID
  String conversationId = '';

  @override
  List<Item>? get items => [
        Item(title: 'getMessage', onTap: getMessage),
        Item(title: 'getReactionList', onTap: getReactionList),
        Item(title: 'getAckCount', onTap: getAckCount),
        Item(title: 'getChatThread: X', onTap: getChatThread),
        Item(title: 'getPinInfo', onTap: getPinInfo),
      ];

  Future<Object?> getMessage() async {
    try {
      final conversation = await EMClient.getInstance.chatManager
          .getConversation(conversationId,
              type: EMConversationType.Chat, createIfNeed: true);
      final message = await conversation?.latestMessage();
      messageId = message?.msgId ?? '';
      debugPrint(
          'Fetched messageId: ${messageId}');
      return messageId; // Return the fetched reactions
    } catch (e) {
      debugPrint('Error fetching reaction list: $e');
    }
    return null;
  }

  Future<Object?> getReactionList() async {
    try {
      final message = await EMClient.getInstance.chatManager
          .loadMessage(messageId);
      final reactions = await message?.reactionList();
      debugPrint(
          'Fetched reactions: ${reactions?.map((r) => r.toString()).toList()}');
      return reactions; // Return the fetched reactions
    } catch (e) {
      debugPrint('Error fetching reaction list: $e');
    }
    return null;
  }

  Future<Object?> getAckCount() async {
    try {
      final message = await EMClient.getInstance.chatManager
          .loadMessage(messageId);
      final ackCount = await message?.groupAckCount();
      debugPrint('Fetched ack count: $ackCount');
      return ackCount; // Return the fetched ack count
    } catch (e) {
      debugPrint('Error fetching ack count: $e');
    }
    return null;
  }

  Future<Object?> getChatThread() async {
    // Implement logic if needed
    debugPrint('getChatThread called');
    return null; // Return null or relevant data
  }

  Future<Object?> getPinInfo() async {
    try {
      final message = await EMClient.getInstance.chatManager
          .loadMessage(messageId);
      final pinInfo = await message?.pinInfo();
      debugPrint(
          'Fetched pin info: ${pinInfo != null ? pinInfo.toMap() : 'No pin info'}');
      return pinInfo; // Return the fetched pin info
    } catch (e) {
      debugPrint('Error fetching pin info: $e');
    }
    return null;
  }
}
