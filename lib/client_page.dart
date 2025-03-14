import 'package:flutter/material.dart';
import 'package:im_flutter_sdk/im_flutter_sdk.dart';
import 'package:test_oh/chat_page.dart';
import 'package:test_oh/chat_room_page.dart';
import 'package:test_oh/conversation_page.dart';
import 'package:test_oh/group_page.dart';
import 'package:test_oh/item_page.dart';
import 'package:test_oh/presence_page.dart';
import 'package:test_oh/push_page.dart';
import 'package:test_oh/userinfo_page.dart';

// ignore: must_be_immutable
class ClientPage extends ItemsPage {
  ClientPage({super.key});

  @override
  List<Item>? get items => [
        Item(title: 'init', onTap: init),
        Item(title: 'login', onTap: login),
        Item(title: 'logout', onTap: logout),
        Item(title: 'chatRoomTest', nextPage: ChatRoomPage()),
        Item(title: 'groupTest', nextPage: GroupPage()),
        Item(title: 'chatTest', nextPage: ChatPage()),
        Item(title: 'conversationTest', nextPage: ConversationPage()),
        Item(title: 'presenceTest', nextPage: PresencePage()),
        Item(title: 'userInfoTest', nextPage: UserInfoPage()),
        Item(title: 'pushManagerTest', nextPage: PushManagerPage()),
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
      await EMClient.getInstance
          .init(EMOptions.withAppKey("1195250312225714#demo"));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<Object?> login() async {
    try {
      await EMClient.getInstance.loginWithPassword('xiaowu002', 'xiaowu002');
      return true;
    } catch (e) {
      return e;
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
