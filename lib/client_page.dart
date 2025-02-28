import 'package:flutter/material.dart';
import 'package:im_flutter_sdk/im_flutter_sdk.dart';
import 'package:test_oh/group_page.dart';
import 'package:test_oh/item_page.dart';

// ignore: must_be_immutable
class ClientPage extends ItemsPage {
  ClientPage({super.key});

  @override
  List<Item>? get items => [
        Item(title: 'init', onTap: init),
        Item(title: 'login', onTap: login),
        Item(title: 'groupTest', nextPage: GroupPage()),
      ];

  @override
  ListenerCallback? get addListenerCallback => (BuildContext ctx) {
        EMClient.getInstance.addConnectionEventHandler(
          'identifier',
          EMConnectionEventHandler(),
        );

        EMClient.getInstance.addMultiDeviceEventHandler(
          'identifier',
          EMMultiDeviceEventHandler(),
        );
      };

  @override
  ListenerCallback? get removeListenerCallback => (BuildContext ctx) {};

  Future<void> init() async {
    try {
      await EMClient.getInstance.init(EMOptions.withAppKey("easemob#dify"));
    } catch (e) {
      debugPrint(e.toString());
    }
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
  }

  Future<void> login() async {
    try {
      await EMClient.getInstance.loginWithPassword('du001', '1');
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
