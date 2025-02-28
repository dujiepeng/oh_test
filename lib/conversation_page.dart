import 'package:flutter/material.dart';
import 'package:im_flutter_sdk/im_flutter_sdk.dart';
import 'package:test_oh/item_page.dart';

// ignore: must_be_immutable
class ConversationPage extends ItemsPage {
  ConversationPage({super.key});

  @override
  List<Item>? get items => [
        Item(title: 'setConversationExt', onTap: setConversationExt),
        Item(title: 'getConversationExt', onTap: getConversationExt),
      ];

  Future<void> setConversationExt() async {
    final conv =
        await EMClient.getInstance.chatManager.getConversation('du002');
    conv?.setExt({'key': 'value'});
  }

  Future<void> getConversationExt() async {
    final conv =
        await EMClient.getInstance.chatManager.getConversation('du002');
    final ext = conv?.ext;
    debugPrint('ext: $ext');
  }
}
