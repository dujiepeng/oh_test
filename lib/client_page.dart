import 'package:flutter/material.dart';
import 'package:im_flutter_sdk/im_flutter_sdk.dart';
import 'package:test_oh/chat_page.dart';
import 'package:test_oh/conversation_page.dart';
import 'package:test_oh/group_page.dart';
import 'package:test_oh/item_page.dart';
import 'package:test_oh/presence_page.dart';

// ignore: must_be_immutable
class ClientPage extends ItemsPage {
  ClientPage({super.key});

  @override
  List<Item>? get items => [
        Item(title: 'init', onTap: init),
        Item(title: 'login', onTap: login),
        Item(title: 'logout', onTap: logout),
        Item(title: 'groupTest', nextPage: GroupPage()),
        Item(title: 'chatTest', nextPage: ChatPage()),
        Item(title: 'conversationTest', nextPage: ConversationPage()),
        Item(title: 'presenceTest', nextPage: PresencePage()),
      ];

  @override
  ListenerCallback? get addListenerCallback => (BuildContext ctx) {
        EMClient.getInstance.addConnectionEventHandler(
          'identifier',
          EMConnectionEventHandler(
            onConnected: () {
              debugPrint('onConnected');
            },
            onDisconnected: () {
              debugPrint('onDisconnected');
            },
          ),
        );

        EMClient.getInstance.addMultiDeviceEventHandler(
          'identifier',
          EMMultiDeviceEventHandler(),
        );
      };

  @override
  ListenerCallback? get removeListenerCallback => (BuildContext ctx) {
        EMClient.getInstance.removeConnectionEventHandler('identifier');
        EMClient.getInstance.removeMultiDeviceEventHandler('identifier');
      };

  Future<void> init() async {
    try {
      await EMClient.getInstance.init(EMOptions.withAppKey("easemob#dify"));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> login() async {
    try {
      await EMClient.getInstance.loginWithPassword('du001', '1');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> logout() async {
    try {
      await EMClient.getInstance.logout();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
