import 'package:flutter/material.dart';
import 'package:im_flutter_sdk/im_flutter_sdk.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_oh/item_page.dart';
import 'package:test_oh/translate_tool.dart';

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
      Item(title: 'send text: Y', onTap: sendTextMessage),
      Item(title: 'send cmd: Y', onTap: sendCmdMessage),
      Item(title: 'send local: Y', onTap: sendLocalMessage),
      Item(title: 'send custom: Y', onTap: sendCustomMessage),
      Item(title: 'send image: Y', onContextTap: sendImageMessage),
      Item(title: 'send file: Y', onContextTap: sendFileMessage),
      Item(title: 'send voice: Y', onContextTap: sendVoiceMessage),
      Item(title: 'resend message: Y', onTap: resendMessage),
      Item(title: 'ack message read: Y', onTap: ackMessageRead),
      Item(title: 'ack group message read: Y', onTap: ackGroupMessageRead),
      Item(title: 'ack conversation read: Y', onTap: ackConversationRead),
      Item(title: 'recall message: Y', onTap: recallMessage),
      Item(title: 'get conversation: Y', onTap: getConversation),
      Item(title: 'get thread conversation: X', onTap: getThreadConversation),
      Item(title: 'mark all chat msg as read: Y', onTap: markAllChatMsgAsRead),
      Item(title: 'get unread message count: X', onTap: getUnreadMessageCount),
      Item(title: 'update chat message: X', onTap: updateChatMessage),
      Item(title: 'download attachment', onTap: downloadAttachment),
      Item(title: 'download thumbnail', onTap: downloadThumbnail),
      Item(
          title: 'download message attachment in combine',
          onTap: downloadMessageAttachmentInCombine),
      Item(
          title: 'download message thumbnail in combine',
          onTap: downloadMessageThumbnailInCombine),
      Item(title: 'import messages: Y', onTap: importMessages),
      Item(title: 'load all conversations: Y', onTap: loadAllConversations),
      Item(
          title: 'get conversations from server',
          onTap: getConversationsFromServer),
      Item(title: 'delete conversation: Y', onTap: deleteConversation),
      Item(title: 'fetch history messages', onTap: fetchHistoryMessages),
      Item(
          title: 'fetch history messages by options: Y',
          onTap: fetchHistoryMessagesByOptions),
      Item(title: 'search chat msg from DB: Y', onTap: searchChatMsgFromDB),
      Item(title: 'get message: Y', onTap: getMessage),
      Item(
          title: 'fetch group message ack: Y',
          onTap: asyncFetchGroupMessageAckFromServer),
      Item(
          title: 'delete remote conversation: Y',
          onTap: deleteRemoteConversation),
      Item(title: 'delete messages before', onTap: deleteMessagesBefore),
      Item(title: 'translate message', onTap: translateMessage),
      Item(title: 'fetch supported languages', onTap: fetchSupportedLanguages),
      Item(title: 'add reaction: Y', onTap: addReaction),
      Item(title: 'remove reaction: Y', onTap: removeReaction),
      Item(title: 'fetch reaction list: Y', onTap: fetchReactionList),
      Item(title: 'fetch reaction detail: oh err', onTap: fetchReactionDetail),
      Item(title: 'report message', onTap: reportMessage),
      Item(
          title: 'get conversations from server with page',
          onTap: getConversationsFromServerWithPage),
      Item(
          title: 'remove msgs from server with ids: Y',
          onTap: removeMessagesFromServerWithMsgIds),
      Item(
          title: 'remove messages from server with ts',
          onTap: removeMessagesFromServerWithTs),
      Item(
          title: 'get conversations from server with cursor: Y',
          onTap: getConversationsFromServerWithCursor),
      Item(
          title: 'get pinned conversations from server with cursor: Y',
          onTap: getPinnedConversationsFromServerWithCursor),
      Item(title: 'pin conversation: Y', onTap: pinConversation),
      Item(title: 'modify message: Y', onTap: modifyMessage),
      Item(
          title: 'download and parse combine message',
          onTap: downloadAndParseCombineMessage),
      Item(
          title: 'add remote and local conversations mark: Y',
          onTap: addRemoteAndLocalConversationsMark),
      Item(
          title: 'delete remote and local conversations mark: Y',
          onTap: deleteRemoteAndLocalConversationsMark),
      Item(
          title: 'fetch conversations by options: Y',
          onTap: fetchConversationsByOptions),
      Item(
          title: 'delete all message and conversation',
          onTap: deleteAllMessageAndConversation),
      Item(title: 'pin message: Y', onTap: pinMessage),
      Item(title: 'unpin message: Y', onTap: unpinMessage),
      Item(title: 'fetch pinned messages: Y', onTap: fetchPinnedMessages),
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
        await EMClient.getInstance.chatManager.sendGroupMessageReadAck(
          msgs!.first.msgId,
          'group_id',
          content: 'hello',
        );
        debugPrint('send group read ack success');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> ackConversationRead() async {
    try {
      await EMClient.getInstance.chatManager.sendConversationReadAck('du002');
      debugPrint('send conversation read ack success');
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
    return conv?.toJsonString();
  }

  Future<Object?> getThreadConversation() async {
    try {
      final conv =
          await EMClient.getInstance.chatManager.getThreadConversation('du001');
      if (conv != null) {
        return conv.toJsonString();
      }
    } catch (e) {
      return e.toString();
    }

    return null;
  }

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

  Future<Object?> getUnreadMessageCount() async {
    try {
      final count =
          await EMClient.getInstance.chatManager.getUnreadMessageCount();
      debugPrint('unread message count: $count');
      return count;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<void> updateChatMessage() async {
    try {
      final conv =
          await EMClient.getInstance.chatManager.getConversation('du002');
      final msg = await conv?.latestMessage();
      msg?.body = EMTextMessageBody(content: 'updated');
      await EMClient.getInstance.chatManager.updateMessage(msg!);
      final newMsg = await conv?.latestMessage();
      debugPrint('update message success: newMsg: ${newMsg.toString()}');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> downloadAttachment() async {}

  Future<void> downloadThumbnail() async {}

  Future<void> downloadMessageAttachmentInCombine() async {}

  Future<void> downloadMessageThumbnailInCombine() async {}

  Future<void> importMessages() async {
    final msg =
        EMMessage.createTxtSendMessage(targetId: 'du001', content: 'import');
    try {
      await EMClient.getInstance.chatManager.importMessages([msg]);
      debugPrint('import messages success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

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

  Future<void> fetchHistoryMessages() async {
    try {
      final result = await EMClient.getInstance.chatManager
          .fetchHistoryMessages(conversationId: 'du002');
      debugPrint('fetch history messages success $result');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> fetchHistoryMessagesByOptions() async {
    try {
      final result =
          await EMClient.getInstance.chatManager.fetchHistoryMessagesByOption(
        'du002',
        EMConversationType.Chat,
        options: const FetchMessageOptions(
          from: 'du001',
          msgTypes: [MessageType.TXT, MessageType.IMAGE],
          needSave: true,
        ),
      );
      debugPrint('fetch history messages by options success $result');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<Object?> searchChatMsgFromDB() async {
    try {
      final msgs =
          await EMClient.getInstance.chatManager.loadMessagesWithKeyword(
        'hello',
        sender: 'du001',
        count: 5,
      );
      debugPrint('search chat msg from DB success');
      return msgs;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<Object?> getMessage() async {
    try {
      final msg = await EMClient.getInstance.chatManager
          .loadMessage('1389028404531041756');
      debugPrint('get message success $msg');
      return msg;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<void> asyncFetchGroupMessageAckFromServer() async {
    try {
      await EMClient.getInstance.chatManager.fetchGroupAcks(
        'group_id',
        'msg_id',
        startAckId: 'start_ack_id',
      );
      debugPrint('async fetch group message ack from server success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> deleteRemoteConversation() async {
    try {
      await EMClient.getInstance.chatManager.deleteRemoteConversation('du002');
      debugPrint('delete remote conversation success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> deleteMessagesBefore() async {
    try {
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      await EMClient.getInstance.chatManager.deleteMessagesBefore(timestamp);
      debugPrint('delete messages before success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> translateMessage() async {}

  Future<void> fetchSupportedLanguages() async {}

  Future<void> addReaction() async {
    try {
      final msg = await EMClient.getInstance.chatManager
          .loadMessage('1389030697259243096');
      await EMClient.getInstance.chatManager.addReaction(
        messageId: msg!.msgId,
        reaction: 'like',
      );
      debugPrint('add reaction success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> removeReaction() async {
    try {
      final msg = await EMClient.getInstance.chatManager
          .loadMessage('1389030697259243096');
      await EMClient.getInstance.chatManager.removeReaction(
        messageId: msg!.msgId,
        reaction: 'like',
      );
      debugPrint('add reaction success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> fetchReactionList() async {
    try {
      final msg = await EMClient.getInstance.chatManager
          .loadMessage('1389030697259243096');
      await EMClient.getInstance.chatManager.fetchReactionList(
        messageIds: [msg!.msgId],
        chatType: ChatType.GroupChat,
        groupId: 'group_id',
      );
      debugPrint('add reaction success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<Object?> fetchReactionDetail() async {
    try {
      final msg = await EMClient.getInstance.chatManager
          .loadMessage('1389030697259243096');
      final result = await EMClient.getInstance.chatManager.fetchReactionDetail(
        messageId: msg!.msgId,
        reaction: 'like',
      );
      debugPrint('add reaction success');
      return result;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<void> reportMessage() async {}

  Future<void> getConversationsFromServerWithPage() async {}

  Future<void> removeMessagesFromServerWithMsgIds() async {
    try {
      await EMClient.getInstance.chatManager.deleteRemoteMessagesWithIds(
        conversationId: "du002",
        type: EMConversationType.Chat,
        msgIds: ["1388018655157028368"],
      );
      debugPrint('remove msgs from server with ids success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> removeMessagesFromServerWithTs() async {}

  Future<Object?> getConversationsFromServerWithCursor() async {
    try {
      final result = await EMClient.getInstance.chatManager.fetchConversation(
        cursor: "1",
        pageSize: 10,
      );
      debugPrint('get conversations from server with cursor success $result');
      return result;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<void> getPinnedConversationsFromServerWithCursor() async {
    try {
      final result =
          await EMClient.getInstance.chatManager.fetchPinnedConversations(
        cursor: "1",
        pageSize: 10,
      );
      debugPrint(
          'get pinned conversations from server with cursor success $result');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> pinConversation() async {
    try {
      await EMClient.getInstance.chatManager
          .pinConversation(conversationId: 'du002', isPinned: true);
      debugPrint('pin conversation success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> modifyMessage() async {
    try {
      await EMClient.getInstance.chatManager.modifyMessage(
          messageId: '1389065664206996932',
          msgBody: EMTextMessageBody(content: 'changed'));
      debugPrint('change message success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> downloadAndParseCombineMessage() async {}

  Future<void> addRemoteAndLocalConversationsMark() async {
    try {
      await EMClient.getInstance.chatManager.addRemoteAndLocalConversationsMark(
        conversationIds: ['du002'],
        mark: ConversationMarkType.Type10,
      );
      debugPrint('add remote and local conversations mark success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> deleteRemoteAndLocalConversationsMark() async {
    try {
      await EMClient.getInstance.chatManager
          .deleteRemoteAndLocalConversationsMark(
        conversationIds: ['du002'],
        mark: ConversationMarkType.Type10,
      );
      debugPrint('remove remote and local conversations mark success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> fetchConversationsByOptions() async {
    try {
      await EMClient.getInstance.chatManager.fetchConversationsByOptions(
        options: ConversationFetchOptions(cursor: 'cursor', pageSize: 10),
      );
      debugPrint('fetch conversations by options success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> deleteAllMessageAndConversation() async {}

  Future<void> pinMessage() async {
    try {
      await EMClient.getInstance.chatManager
          .pinMessage(messageId: '1389072439916365328');
      debugPrint('pin message success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> unpinMessage() async {
    try {
      await EMClient.getInstance.chatManager
          .unpinMessage(messageId: '1389072439916365328');
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

  Future<Object?> getMessageCount() async {
    try {
      final count = await EMClient.getInstance.chatManager.getAllMessageCount();
      debugPrint('message count: $count');
      return count;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
