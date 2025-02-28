import 'package:flutter/material.dart';
import 'package:im_flutter_sdk/im_flutter_sdk.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_oh/item_page.dart';

// ignore: must_be_immutable
class ChatPage extends ItemsPage {
  ChatPage({super.key});

  @override
  ListenerCallback? get addListenerCallback => (BuildContext ctx) {
        EMClient.getInstance.chatManager.addEventHandler(
          'identifier',
          EMChatEventHandler(onCmdMessagesReceived: (messages) {
            debugPrint('onCmdMessagesReceived: $messages');
          }, onMessagesReceived: (messages) {
            debugPrint('onMessagesReceived: $messages');
          }, onMessagesRead: (messages) {
            debugPrint('onMessagesRead: $messages');
          }, onMessagesDelivered: (messages) {
            debugPrint('onMessagesDelivered: $messages');
          }, onMessagesRecalled: (messages) {
            debugPrint('onMessagesRecalled: $messages');
          }, onConversationRead: (from, to) {
            debugPrint('onConversationRead: $from, $to');
          }, onConversationsUpdate: () {
            debugPrint('onConversationsUpdate');
          }, onGroupMessageRead: (groupMessageAcks) {
            debugPrint('onGroupMessageRead: $groupMessageAcks');
          }, onMessageContentChanged: (message, operatorId, operationTime) {
            debugPrint(
                'onMessageContentChanged: $message, $operatorId, $operationTime');
          }, onMessagePinChanged:
              (messageId, conversationId, pinOperation, pinInfo) {
            debugPrint(
                'onMessagePinChanged: $messageId, $conversationId, $pinOperation, $pinInfo');
          }, onMessageReactionDidChange: (events) {
            debugPrint('onMessageReactionDidChange: $events');
          }, onMessagesRecalledInfo: (p0) {
            debugPrint('onMessagesRecalledInfo: $p0');
          }),
        );

        EMClient.getInstance.chatManager.addMessageEvent(
          'identifier',
          ChatMessageEvent(
            onSuccess: (msgId, msg) {
              debugPrint('onSuccess: $msgId, $msg');
            },
            onError: (msgId, msg, e) {
              debugPrint('onError: $msgId, $msg, $e');
            },
            onProgress: (progress, status) {
              debugPrint('onProgress: $progress, $status');
            },
          ),
        );
      };
  @override
  ListenerCallback? get removeListenerCallback => (ctx) {};

  @override
  String? get title => 'Chat Test';

  @override
  List<Item>? get items => getItems();

  List<Item> getItems() {
    final list = [
      Item(title: 'send text', onTap: sendTextMessage),
      Item(title: 'send cmd', onTap: sendCmdMessage),
      Item(title: 'send local', onTap: sendLocalMessage),
      Item(title: 'send custom', onTap: sendCustomMessage),
      Item(title: 'send image', onContextTap: sendImageMessage),
      Item(title: 'send file', onContextTap: sendFileMessage),
      Item(title: 'send voice', onContextTap: sendVoiceMessage),
      Item(title: 'resend message', onTap: resendMessage),
      Item(title: 'ack message read', onTap: ackMessageRead),
      Item(title: 'ack group message read', onTap: ackGroupMessageRead),
      Item(title: 'ack conversation read', onTap: ackConversationRead),
      Item(title: 'recall message', onTap: recallMessage),
      Item(title: 'get conversation', onTap: getConversation),
      Item(title: 'get thread conversation', onTap: getThreadConversation),
      Item(title: 'mark all chat msg as read', onTap: markAllChatMsgAsRead),
      Item(title: 'get unread message count', onTap: getUnreadMessageCount),
      Item(title: 'update chat message', onTap: updateChatMessage),
      Item(title: 'download attachment', onTap: downloadAttachment),
      Item(title: 'download thumbnail', onTap: downloadThumbnail),
      Item(
          title: 'download message attachment in combine',
          onTap: downloadMessageAttachmentInCombine),
      Item(
          title: 'download message thumbnail in combine',
          onTap: downloadMessageThumbnailInCombine),
      Item(title: 'import messages', onTap: importMessages),
      Item(title: 'load all conversations', onTap: loadAllConversations),
      Item(
          title: 'get conversations from server',
          onTap: getConversationsFromServer),
      Item(title: 'delete conversation', onTap: deleteConversation),
      Item(title: 'fetch history messages', onTap: fetchHistoryMessages),
      Item(
          title: 'fetch history messages by options',
          onTap: fetchHistoryMessagesByOptions),
      Item(title: 'search chat msg from DB', onTap: searchChatMsgFromDB),
      Item(title: 'get message', onTap: getMessage),
      Item(
          title: 'async fetch group message ack from server',
          onTap: asyncFetchGroupMessageAckFromServer),
      Item(
          title: 'delete remote conversation', onTap: deleteRemoteConversation),
      Item(title: 'delete messages before', onTap: deleteMessagesBefore),
      Item(title: 'translate message', onTap: translateMessage),
      Item(title: 'fetch supported languages', onTap: fetchSupportedLanguages),
      Item(title: 'add reaction', onTap: addReaction),
      Item(title: 'remove reaction', onTap: removeReaction),
      Item(title: 'fetch reaction list', onTap: fetchReactionList),
      Item(title: 'fetch reaction detail', onTap: fetchReactionDetail),
      Item(title: 'report message', onTap: reportMessage),
      Item(
          title: 'get conversations from server with page',
          onTap: getConversationsFromServerWithPage),
      Item(
          title: 'remove messages from server with msg ids',
          onTap: removeMessagesFromServerWithMsgIds),
      Item(
          title: 'remove messages from server with ts',
          onTap: removeMessagesFromServerWithTs),
      Item(
          title: 'get conversations from server with cursor',
          onTap: getConversationsFromServerWithCursor),
      Item(
          title: 'get pinned conversations from server with cursor',
          onTap: getPinnedConversationsFromServerWithCursor),
      Item(title: 'pin conversation', onTap: pinConversation),
      Item(title: 'modify message', onTap: modifyMessage),
      Item(
          title: 'download and parse combine message',
          onTap: downloadAndParseCombineMessage),
      Item(
          title: 'add remote and local conversations mark',
          onTap: addRemoteAndLocalConversationsMark),
      Item(
          title: 'delete remote and local conversations mark',
          onTap: deleteRemoteAndLocalConversationsMark),
      Item(
          title: 'fetch conversations by options',
          onTap: fetchConversationsByOptions),
      Item(
          title: 'delete all message and conversation',
          onTap: deleteAllMessageAndConversation),
      Item(title: 'pin message', onTap: pinMessage),
      Item(title: 'unpin message', onTap: unpinMessage),
      Item(title: 'fetch pinned messages', onTap: fetchPinnedMessages),
      Item(title: 'search msg by options', onTap: searchMsgByOptions),
      Item(title: 'get message count', onTap: getMessageCount),
    ];

    return list;
  }

  // sentTextMessage
  Future<void> sendTextMessage() async {
    try {
      final msg = EMMessage.createTxtSendMessage(
        content: 'Hello, I am du001',
        targetId: 'du002',
      );
      msg.attributes = {
        "str_key": "str_value",
        "int_key": 1,
        "bool_key": true,
        "list_key": ["v1", "v2"],
        "map_key": {"k1": "v1"},
      };
      await EMClient.getInstance.chatManager.sendMessage(msg);
      debugPrint('send message success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // sendCmdMessage
  Future<void> sendCmdMessage() async {
    try {
      final msg =
          EMMessage.createCmdSendMessage(targetId: 'du002', action: 'action');

      await EMClient.getInstance.chatManager.sendMessage(msg);
      debugPrint('send cmd message success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> sendLocalMessage() async {
    try {
      final msg = EMMessage.createLocationSendMessage(
        targetId: 'du002',
        latitude: 10000,
        longitude: 1000,
        buildingName: 'test',
        address: '111',
      );

      await EMClient.getInstance.chatManager.sendMessage(msg);
      debugPrint('send local message success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> sendCustomMessage() async {
    try {
      final msg = EMMessage.createCustomSendMessage(
        targetId: 'du002',
        event: 'event',
        params: {'key': 'value'},
      );
      await EMClient.getInstance.chatManager.sendMessage(msg);
      debugPrint('send custom message success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> sendImageMessage(BuildContext ctx) async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file == null) {
      return;
    }
    try {
      final msg = EMMessage.createImageSendMessage(
        filePath: file.path,
        displayName: file.name,
        width: 100,
        height: 100,
        targetId: 'du002',
      );
      await EMClient.getInstance.chatManager.sendMessage(msg);
      debugPrint('send image message success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> sendFileMessage(BuildContext ctx) async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file == null) {
      return;
    }
    try {
      final msg = EMMessage.createFileSendMessage(
        filePath: file.path,
        displayName: file.name,
        targetId: 'du002',
      );
      await EMClient.getInstance.chatManager.sendMessage(msg);
      debugPrint('send file message success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> sendVoiceMessage(BuildContext ctx) async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file == null) {
      return;
    }
    try {
      final msg = EMMessage.createVoiceSendMessage(
        filePath: file.path,
        displayName: file.name,
        targetId: 'du002',
        duration: 30,
      );
      await EMClient.getInstance.chatManager.sendMessage(msg);
      debugPrint('send voice message success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> resendMessage() async {
    try {
      final msg = EMMessage.createTxtSendMessage(
        content: 'Hello, I am du001',
        targetId: 'du002',
      );

      await EMClient.getInstance.chatManager.resendMessage(msg);
      debugPrint('resend message success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> ackMessageRead() async {
    try {
      final conv =
          await EMClient.getInstance.chatManager.getConversation('du002');
      final msgs = await conv?.loadMessages();
      if (msgs?.isNotEmpty == true) {
        await EMClient.getInstance.chatManager.sendMessageReadAck(msgs!.first);
        debugPrint('send read ack success');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> ackGroupMessageRead() async {
    try {
      final conv =
          await EMClient.getInstance.chatManager.getConversation('du002');
      final msgs = await conv?.loadMessages();
      if (msgs?.isNotEmpty == true) {
        await EMClient.getInstance.chatManager.sendMessageReadAck(msgs!.first);
        debugPrint('send read ack success');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> ackConversationRead() async {
    try {
      await EMClient.getInstance.chatManager.sendConversationReadAck('du002');
      debugPrint('send read ack success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> recallMessage() async {
    try {
      await EMClient.getInstance.chatManager
          .recallMessage('1388018171339871760');
      debugPrint('recall message success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<Object?> getConversation() async {
    final conv =
        await EMClient.getInstance.chatManager.getConversation('du002');
    debugPrint('conv: $conv');
    return conv.toString();
  }

  Future<void> getThreadConversation() async {}

  Future<void> markAllChatMsgAsRead() async {
    try {
      final conv =
          await EMClient.getInstance.chatManager.getConversation('du002');
      conv?.markAllMessagesAsRead();
      debugPrint('mark all chat msg as read success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getUnreadMessageCount() async {
    try {
      final conv =
          await EMClient.getInstance.chatManager.getConversation('du002');
      final count = conv?.unreadCount();
      debugPrint('unread message count: $count');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> updateChatMessage() async {}

  Future<void> downloadAttachment() async {}

  Future<void> downloadThumbnail() async {}

  Future<void> downloadMessageAttachmentInCombine() async {}

  Future<void> downloadMessageThumbnailInCombine() async {}

  Future<void> importMessages() async {}

  Future<Object?> loadAllConversations() async {
    return await EMClient.getInstance.chatManager.loadAllConversations();
  }

  Future<void> getConversationsFromServer() async {
    try {
      final list = await EMClient.getInstance.chatManager
          .fetchConversationListFromServer();
      debugPrint('fetch conversations from server success $list');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> deleteConversation() async {
    await EMClient.getInstance.chatManager
        .deleteConversation('du002', deleteMessages: true);
    debugPrint('delete conversation success');
  }

  Future<void> fetchHistoryMessages() async {}

  Future<void> fetchHistoryMessagesByOptions() async {}

  Future<void> searchChatMsgFromDB() async {}

  Future<void> getMessage() async {}

  Future<void> asyncFetchGroupMessageAckFromServer() async {}

  Future<void> deleteRemoteConversation() async {}

  Future<void> deleteMessagesBefore() async {}

  Future<void> translateMessage() async {}

  Future<void> fetchSupportedLanguages() async {}

  Future<void> addReaction() async {}

  Future<void> removeReaction() async {}

  Future<void> fetchReactionList() async {}

  Future<void> fetchReactionDetail() async {}

  Future<void> reportMessage() async {}

  Future<void> getConversationsFromServerWithPage() async {}

  Future<void> removeMessagesFromServerWithMsgIds() async {}

  Future<void> removeMessagesFromServerWithTs() async {}

  Future<void> getConversationsFromServerWithCursor() async {}

  Future<void> getPinnedConversationsFromServerWithCursor() async {}

  Future<void> pinConversation() async {}

  Future<void> modifyMessage() async {
    try {
      await EMClient.getInstance.chatManager.modifyMessage(
          messageId: '1388018655157028368',
          msgBody: EMTextMessageBody(content: 'changed'));
      debugPrint('change message success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> downloadAndParseCombineMessage() async {}

  Future<void> addRemoteAndLocalConversationsMark() async {}

  Future<void> deleteRemoteAndLocalConversationsMark() async {}

  Future<void> fetchConversationsByOptions() async {}

  Future<void> deleteAllMessageAndConversation() async {}

  Future<void> pinMessage() async {
    try {
      await EMClient.getInstance.chatManager
          .pinMessage(messageId: '1388018655157028368');
      debugPrint('pin message success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> unpinMessage() async {
    try {
      await EMClient.getInstance.chatManager
          .unpinMessage(messageId: '1388018655157028368');
      debugPrint('unpin message success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<Object?> fetchPinnedMessages() async {
    try {
      final list = await EMClient.getInstance.chatManager
          .fetchPinnedMessages(conversationId: 'du002');
      debugPrint('fetch pinned messages success $list');
      return list;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<void> searchMsgByOptions() async {}

  Future<void> getMessageCount() async {
    try {
      final count = await EMClient.getInstance.chatManager.getAllMessageCount();
      debugPrint('message count: $count');
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
