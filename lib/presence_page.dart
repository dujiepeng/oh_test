import 'package:flutter/material.dart';
import 'package:im_flutter_sdk/im_flutter_sdk.dart';
import 'package:test_oh/item_page.dart';

class PresencePage extends ItemsPage {
  PresencePage({super.key});

  String description = 'online';
  List<String> members = ['', '']; // Example members
  int expiry = 3600; // Example expiry time in seconds
  int pageSize = 10;
  int pageNum = 1;

  @override
  ListenerCallback? get addListenerCallback => (BuildContext ctx) {
        EMClient.getInstance.presenceManager.addEventHandler(
          'identifier',
            EMPresenceEventHandler(onPresenceStatusChanged: (List<EMPresence> list) {
              debugPrint('onPresenceStatusChanged: ${list.map((p) => p.toString() ).toList()}');
            }));
      };

  @override
  ListenerCallback? get removeListenerCallback => (ctx) {};

  @override
  List<Item>? get items => [
        Item(
            title: 'publishPresenceWithDescription: Y',
            onTap: publishPresenceWithDescription),
        Item(title: 'subscribe: Y', onTap: subscribe),
        Item(title: 'unsubscribe: Y', onTap: unsubscribe),
        Item(title: 'fetchPresenceStatus: Y', onTap: fetchPresenceStatus),
        Item(
            title: 'fetchSubscribedMembersWithPageNum: Y',
            onTap: fetchSubscribedMembersWithPageNum),
      ];

  Future<Object?> publishPresenceWithDescription() async {
    try {
      await EMClient.getInstance.presenceManager.publishPresence(description);
      debugPrint('Presence published with description: $description');
      return true;
    } catch (e) {
      debugPrint('Error publishing presence: $e');
    }
    return null;
  }

  Future<Object?> subscribe() async {
    try {
      final presences = await EMClient.getInstance.presenceManager
          .subscribe(members: members, expiry: expiry);
      debugPrint(
          'Subscribed to presences: ${presences.map((p) => p.toString()).toList()}');
      return presences;
    } catch (e) {
      debugPrint('Error subscribing to presences: $e');
    }
    return null;
  }

  Future<Object?> unsubscribe() async {
    try {
      await EMClient.getInstance.presenceManager.unsubscribe(members: members);
      debugPrint('Unsubscribed from presences. members: $members');
      return true;
    } catch (e) {
      debugPrint('Error unsubscribing from presences: $e');
    }
    return null;
  }

  Future<Object?> fetchPresenceStatus() async {
    try {
      final presences = await EMClient.getInstance.presenceManager
          .fetchPresenceStatus(members: members);
      debugPrint(
          'Fetched presence status: ${presences.map((p) => p.toString()).toList()}');
      return presences;
    } catch (e) {
      debugPrint('Error fetching presence status: $e');
    }
    return null;
  }

  Future<Object?> fetchSubscribedMembersWithPageNum() async {
    try {
      final members = await EMClient.getInstance.presenceManager
          .fetchSubscribedMembers(pageNum: pageNum, pageSize: pageSize);
      debugPrint('Fetched subscribed members: $members');
      return members;
    } catch (e) {
      debugPrint('Error fetching subscribed members: $e');
    }
    return null;
  }
}
