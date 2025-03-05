import 'package:flutter/material.dart';
import 'package:im_flutter_sdk/im_flutter_sdk.dart';
import 'package:test_oh/item_page.dart';

// ignore: must_be_immutable
class ConversationPage extends ItemsPage {
  ConversationPage({super.key});

  EMConversation? _conversation;
  String conversationId = ''; // Variable to store the input conversation ID
  String msgId = '';

  @override
  List<Item>? get items => [
        Item(title: 'getConversation', onTap: getConversation),
        Item(title: 'getUnreadMsgCount: Y', onTap: getUnreadMsgCount),
        Item(title: 'markAllMessagesAsRead: Y', onTap: markAllMessagesAsRead),
        Item(title: 'markMessageAsRead: Y', onTap: markMessageAsRead),
        Item(title: 'syncConversationExt: Y', onTap: syncConversationExt),
        Item(title: 'removeMessage: Y', onTap: removeMessage),
        Item(title: 'deleteMessageByIds: Y', onTap: deleteMessageByIds),
        Item(title: 'getLatestMessage: Y', onTap: getLatestMessage),
        Item(
            title: 'getLatestMessageFromOthers: Y',
            onTap: getLatestMessageFromOthers),
        Item(title: 'clearAllMessages: Y', onTap: clearAllMessages),
        Item(title: 'deleteMessagesWithTs: X', onTap: deleteMessagesWithTs),
        Item(title: 'insertMessage: Y', onTap: insertMessage),
        Item(title: 'appendMessage: Y', onTap: appendMessage),
        Item(
            title: 'updateConversationMessage: Y',
            onTap: updateConversationMessage),
        Item(title: 'loadMsgWithId: Y', onTap: loadMsgWithId),
        Item(title: 'loadMsgWithStartId: Y', onTap: loadMsgWithStartId),
        Item(title: 'loadMsgWithKeywords: Y', onTap: loadMsgWithKeywords),
        Item(title: 'loadMsgWithMsgType: Y', onTap: loadMsgWithMsgType),
        Item(title: 'loadMsgWithTime: Y', onTap: loadMsgWithTime),
        Item(title: 'messageCount: Y', onTap: messageCount),
        Item(
            title: 'removeMsgFromServerWithMsgList: Y',
            onTap: removeMsgFromServerWithMsgList),
        Item(
            title: 'removeMsgFromServerWithTimeStamp: Y',
            onTap: removeMsgFromServerWithTimeStamp),
        Item(title: 'pinnedMessages: Y', onTap: pinnedMessages),
        Item(title: 'remindType: Y', onTap: remindType),
        Item(title: 'searchMsgByOptions: Y', onTap: searchMsgByOptions),
        Item(title: 'getLocalMessageCount: Y', onTap: getLocalMessageCount),
        Item(
            title: 'deleteLocalAndServerMessages: Y',
            onTap: deleteLocalAndServerMessages),
        Item(
            title: 'deleteLocalAndServerMessagesByTime: Y',
            onTap: deleteLocalAndServerMessagesByTime),
      ];

  Future<EMConversation?> getConversation() async {
    try {
      _conversation = await EMClient.getInstance.chatManager.getConversation(
          conversationId,
          type: EMConversationType.Chat,
          createIfNeed: true);

      final message = EMMessage.createTxtSendMessage(
          targetId: conversationId, content: 'Hello HarmonyOS');
      _conversation?.appendMessage(message);
      final textBody = new EMTextMessageBody(content: 'Hello Harmony 2');
      final message2 = EMMessage.createReceiveMessage(body: textBody);
      message2.hasRead = false;
      _conversation?.insertMessage(message2);
      msgId = message2.msgId;
      return _conversation;
    } catch (e) {
      debugPrint('Error getting conversation: $e');
      return null;
    }
  }

  Future<Object?> getUnreadMsgCount() async {
    try {
      final conv = await EMClient.getInstance.chatManager
          .getConversation(conversationId);
      final count = await conv?.unreadCount();
      debugPrint('Unread Message Count: $count');
      return count;
    } catch (e) {
      debugPrint('Error getting unread message count: $e');
      return null;
    }
  }

  Future<void> markAllMessagesAsRead() async {
    try {
      final conv = await EMClient.getInstance.chatManager
          .getConversation(conversationId);
      conv?.markAllMessagesAsRead();
      debugPrint('All messages marked as read.');
    } catch (e) {
      debugPrint('Error marking all messages as read: $e');
    }
  }

  Future<void> markMessageAsRead() async {
    try {
      final conv = await EMClient.getInstance.chatManager
          .getConversation(conversationId);
      if (conv != null) {
        final lastestMessage = await conv.latestMessage();
        debugPrint(
            'Message marked as read. messageId: ${lastestMessage?.msgId}');
        // Example message ID, replace with actual ID
        await conv.markMessageAsRead(lastestMessage?.msgId ?? '');
        debugPrint('Message marked as read.');
      }
    } catch (e) {
      debugPrint('Error marking message as read: $e');
    }
  }

  Future<Object?> syncConversationExt() async {
    try {
      final conv = await EMClient.getInstance.chatManager
          .getConversation(conversationId);
      if (conv != null) {
        await conv.setExt({'key': 'new_value'});
        debugPrint('Conversation extension synchronized.');
        return conv.ext;
      }
    } catch (e) {
      debugPrint('Error syncing conversation extension: $e');
    }
    return null;
  }

  Future<void> removeMessage() async {
    try {
      final conv = await EMClient.getInstance.chatManager
          .getConversation(conversationId);
      if (conv != null) {
        final message = await conv.latestMessage();
        msgId = message?.msgId ?? '';
        // Example message ID, replace with actual ID
        await conv.deleteMessage(msgId);
        debugPrint('Message removed msgId: $msgId.');
      }
    } catch (e) {
      debugPrint('Error removing message: $e');
    }
  }

  Future<void> deleteMessageByIds() async {
    try {
      final conv = await EMClient.getInstance.chatManager
          .getConversation(conversationId);
      if (conv != null) {
        final message = await conv.latestMessage();
        msgId = message?.msgId ?? '';
        // Example message IDs, replace with actual IDs
        await conv.deleteMessageByIds([msgId]);
        debugPrint('Messages deleted by IDs.$msgId');
      }
    } catch (e) {
      debugPrint('Error deleting messages by IDs: $e');
    }
  }

  Future<Object?> getLatestMessage() async {
    try {
      final conv = await EMClient.getInstance.chatManager
          .getConversation(conversationId);
      final message = await conv?.latestMessage();
      debugPrint('Latest Message: ${message?.toJson()}');
      return message?.toJson();
    } catch (e) {
      debugPrint('Error getting latest message: $e');
    }
    return null;
  }

  Future<Object?> getLatestMessageFromOthers() async {
    try {
      final conv = await EMClient.getInstance.chatManager
          .getConversation(conversationId);
      final message = await conv?.lastReceivedMessage();
      debugPrint('Latest Message from Others: ${message?.toJson()}');
      return message?.toJson();
    } catch (e) {
      debugPrint('Error getting latest message from others: $e');
    }
    return null;
  }

  Future<void> clearAllMessages() async {
    try {
      final conv = await EMClient.getInstance.chatManager
          .getConversation(conversationId);
      await conv?.deleteAllMessages();
      debugPrint('All messages cleared.');
    } catch (e) {
      debugPrint('Error clearing all messages: $e');
    }
  }

  Future<void> deleteMessagesWithTs() async {
    try {
      final conv = await EMClient.getInstance.chatManager
          .getConversation(conversationId);
      if (conv != null) {
        // Example timestamps, replace with actual values
        await conv.deleteMessagesWithTs(
            0, DateTime.now().millisecondsSinceEpoch);
        debugPrint('Messages deleted within timestamp range.');
      }
    } catch (e) {
      debugPrint('Error deleting messages with timestamps: $e');
    }
  }

  Future<Object?> insertMessage() async {
    try {
      final conv = await EMClient.getInstance.chatManager
          .getConversation(conversationId);
      if (conv != null) {
        // Example message, replace with actual message
        EMMessage message = EMMessage.createTxtSendMessage(
            targetId: conversationId,
            content: 'hello harmonyOs',
            chatType: ChatType.Chat);
        await conv.insertMessage(message);
        debugPrint('Message inserted.');
        return message.toJson();
      }
    } catch (e) {
      debugPrint('Error inserting message: $e');
    }
    return null;
  }

  Future<Object?> appendMessage() async {
    try {
      final conv = await EMClient.getInstance.chatManager
          .getConversation(conversationId);
      if (conv != null) {
        // Example message, replace with actual message
        EMMessage message = EMMessage.createTxtSendMessage(
            targetId: conversationId,
            content: 'hello world',
            chatType: ChatType.Chat);
        await conv.appendMessage(message);
        debugPrint('Message appended.');
        return message.toJson();
      }
    } catch (e) {
      debugPrint('Error appending message: $e');
    }
    return null;
  }

  Future<Object?> updateConversationMessage() async {
    try {
      final conv = await EMClient.getInstance.chatManager
          .getConversation(conversationId);
      if (conv != null) {
        // Example message, replace with actual message
        final message = await conv.latestMessage();
        if (message != null) {
          // Judge whether the message is a text message
          if (message.body is EMTextMessageBody) {
            final textBody = message.body as EMTextMessageBody;
            final textBody2 = EMTextMessageBody(content: 'Updated message');
            final content = textBody.content;
            debugPrint('Message updated before. content: $content');
            message.body = textBody2;
            await conv.updateMessage(message);
            debugPrint('Message updated.');
            return message.toJson();
          }
        }
        return null;
      }
    } catch (e) {
      debugPrint('Error updating conversation message: $e');
    }
    return null;
  }

  Future<Object?> loadMsgWithId() async {
    try {
      final conv = await EMClient.getInstance.chatManager
          .getConversation(conversationId);
      if (conv != null) {
        final msg = await conv.latestMessage();
        debugPrint('Latest Message: ${msg?.toJson()}');
        // Example message ID, replace with actual ID
        final message = await conv.loadMessage(msg?.msgId ?? '');
        debugPrint('Loaded Message: ${message?.toJson()}');
        return message?.toJson();
      }
    } catch (e) {
      debugPrint('Error loading message with ID: $e');
    }
    return null;
  }

  Future<Object?> loadMsgWithStartId() async {
    try {
      final conv = await EMClient.getInstance.chatManager
          .getConversation(conversationId);
      if (conv != null) {
        // Example start ID, replace with actual ID
        final messages = await conv.loadMessages(startMsgId: '');
        debugPrint('Loaded Messages: ${messages.length}');
        return messages.length;
      }
    } catch (e) {
      debugPrint('Error loading messages with start ID: $e');
    }
    return null;
  }

  Future<Object?> loadMsgWithKeywords() async {
    try {
      final conv = await EMClient.getInstance.chatManager
          .getConversation(conversationId);
      if (conv != null) {
        final messages = await conv.loadMessagesWithKeyword('hello');
        debugPrint('Loaded Messages with Keyword: ${messages.length}');
        return messages.length;
      }
    } catch (e) {
      debugPrint('Error loading messages with keywords: $e');
    }
    return null;
  }

  Future<Object?> loadMsgWithMsgType() async {
    try {
      final conv = await EMClient.getInstance.chatManager
          .getConversation(conversationId);
      if (conv != null) {
        final messages =
            await conv.loadMessagesWithMsgType(type: MessageType.TXT);
        debugPrint('Loaded Messages with MsgType: ${messages.length}');
        return messages.length;
      }
    } catch (e) {
      debugPrint('Error loading messages with message type: $e');
    }
    return null;
  }

  Future<Object?> loadMsgWithTime() async {
    try {
      final conv = await EMClient.getInstance.chatManager
          .getConversation(conversationId);
      if (conv != null) {
        final messages = await conv.loadMessagesFromTime(
            startTime: 0, endTime: DateTime.now().millisecondsSinceEpoch);
        debugPrint('Loaded Messages from Time: ${messages.length}');
        return messages.length;
      }
    } catch (e) {
      debugPrint('Error loading messages from time: $e');
    }
    return null;
  }

  Future<Object?> messageCount() async {
    try {
      final conv = await EMClient.getInstance.chatManager
          .getConversation(conversationId);
      final count = await conv?.messagesCount();
      debugPrint('Message Count: $count');
      return count;
    } catch (e) {
      debugPrint('Error getting message count: $e');
    }
    return null;
  }

  Future<void> removeMsgFromServerWithMsgList() async {
    try {
      final conv = await EMClient.getInstance.chatManager
          .getConversation(conversationId);
      if (conv != null) {
        // Example timestamp, replace with actual value
        await conv.deleteLocalAndServerMessagesByTime(
            beforeMs: DateTime.now().millisecondsSinceEpoch);
        debugPrint('Messages removed from server by timestamp.');
      }
    } catch (e) {
      debugPrint('Error removing messages from server with message list: $e');
    }
  }

  Future<Object?> pinnedMessages() async {
    try {
      final conv = await EMClient.getInstance.chatManager
          .getConversation(conversationId);
      final messages = await conv?.loadPinnedMessages();
      debugPrint(
          'Pinned Messages: ${messages?.map((msg) => msg.toJson()).toList()}');
      return messages?.map((msg) => msg.toJson()).toList();
    } catch (e) {
      debugPrint('Error getting pinned messages: $e');
    }
    return null;
  }

  Future<Object?> remindType() async {
    try {
      final conv = await EMClient.getInstance.chatManager
          .getConversation(conversationId);
      final remindType = await conv?.remindType();
      debugPrint('Remind Type: $remindType');
      return remindType;
    } catch (e) {
      debugPrint('Error getting remind type: $e');
    }
    return null;
  }

  Future<Object?> searchMsgByOptions() async {
    try {
      final conv = await EMClient.getInstance.chatManager
          .getConversation(conversationId);
      if (conv != null) {
        // Example search options, replace with actual options
        final messages = await conv.searchMsgsByOptions(MessageSearchOptions(
          ts: DateTime.now().millisecondsSinceEpoch,
          count: 20,
          direction: EMSearchDirection.Up,
          types: [MessageType.TXT],
        ));
        debugPrint('Messages found by options: ${messages.length}');
        return messages.length;
      }
    } catch (e) {
      debugPrint('Error searching messages by options: $e');
    }
    return null;
  }

  Future<Object?> getLocalMessageCount() async {
    try {
      final conv = await EMClient.getInstance.chatManager
          .getConversation(conversationId);
      if (conv != null) {
        // Example timestamps, replace with actual values
        final count = await conv.getLocalMessageCount(
            startMs: 0, endMs: DateTime.now().millisecondsSinceEpoch);
        debugPrint('Local Message Count: $count');
        return count;
      }
    } catch (e) {
      debugPrint('Error getting local message count: $e');
    }
    return null;
  }

  Future<void> deleteLocalAndServerMessages() async {
    try {
      final conv = await EMClient.getInstance.chatManager
          .getConversation(conversationId);
      if (conv != null) {
        final msg = await conv.latestMessage();
        msgId = msg?.msgId ?? '';
        // Example message IDs, replace with actual IDs
        await conv.deleteLocalAndServerMessages(msgIds: [msgId]);
        debugPrint('Local and server messages deleted. msgId: $msgId');
      }
    } catch (e) {
      debugPrint('Error deleting local and server messages: $e');
    }
  }

  Future<void> removeMsgFromServerWithTimeStamp() async {
    try {
      final conv = await EMClient.getInstance.chatManager
          .getConversation(conversationId);
      if (conv != null) {
        // Example timestamp, replace with actual value
        await conv.deleteLocalAndServerMessagesByTime(
            beforeMs: DateTime.now().millisecondsSinceEpoch);
        debugPrint('Messages removed from server by timestamp.');
      }
    } catch (e) {
      debugPrint('Error removing messages from server with timestamp: $e');
    }
  }

  Future<void> deleteLocalAndServerMessagesByTime() async {
    try {
      final conv = await EMClient.getInstance.chatManager
          .getConversation(conversationId);
      if (conv != null) {
        // Example timestamp, replace with actual value
        await conv.deleteLocalAndServerMessagesByTime(
            beforeMs: DateTime.now().millisecondsSinceEpoch);
        debugPrint('Local and server messages deleted by time.');
      }
    } catch (e) {
      debugPrint('Error deleting local and server messages by time: $e');
    }
  }
}
