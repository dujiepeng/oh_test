import 'package:flutter/material.dart';
import 'package:im_flutter_sdk/im_flutter_sdk.dart';
import 'package:test_oh/item_page.dart';

class PushManagerPage extends ItemsPage {
  PushManagerPage({super.key});

  String pushNickname = 'NewNickname'; // Example push nickname
  DisplayStyle pushStyle =
      DisplayStyle.Simple; // Example push style
  String conversationId = ''; // Example conversation ID
  EMConversationType type = EMConversationType.Chat;
  ChatPushRemindType remindType =
      ChatPushRemindType.NONE; // Example remind type

  @override
  List<Item>? get items => [
        Item(title: 'getImPushConfig: X', onTap: getImPushConfig),
        Item(title: 'updatePushNickname: Y', onTap: updatePushNickname),
        Item(title: 'updateImPushStyle: Y', onTap: updateImPushStyle),
        Item(
            title: 'setConversationSilentMode: Y',
            onTap: setConversationSilentMode),
        Item(
            title: 'removeConversationSilentMode: Y',
            onTap: removeConversationSilentMode),
        Item(
            title: 'fetchConversationSilentMode: Y',
            onTap: fetchConversationSilentMode),
        Item(title: 'setSilentModeForAll: Y', onTap: setSilentModeForAll),
        Item(title: 'fetchSilentModeForAll: Y', onTap: fetchSilentModeForAll),
        Item(
            title: 'fetchSilentModeForConversations: Y',
            onTap: fetchSilentModeForConversations),
        Item(
            title: 'setPreferredNotificationLanguage: X',
            onTap: setPreferredNotificationLanguage),
        Item(
            title: 'fetchPreferredNotificationLanguage: X',
            onTap: fetchPreferredNotificationLanguage),
        Item(title: 'getPushTemplate: Y', onTap: getPushTemplate),
        Item(title: 'setPushTemplate: Y', onTap: setPushTemplate),
        Item(title: 'syncSilentModels: Y', onTap: syncSilentModels),
        Item(title: 'bindDeviceToken: Y', onTap: bindDeviceToken),
      ];

  Future<Object?> getImPushConfig() async {
    debugPrint('getImPushConfig called');
    return null; // Return null or relevant data
  }

  Future<Object?> updatePushNickname() async {
    try {
      await EMClient.getInstance.pushManager.updatePushNickname(pushNickname);
      debugPrint('Push nickname updated to: $pushNickname');
      return pushNickname; // Return the updated nickname
    } catch (e) {
      debugPrint('Error updating push nickname: $e');
    }
    return null;
  }

  Future<Object?> updateImPushStyle() async {
    try {
      await EMClient.getInstance.pushManager.updatePushDisplayStyle(pushStyle);
      debugPrint('Push display style updated to: $pushStyle');
      return pushStyle; // Return the updated style
    } catch (e) {
      debugPrint('Error updating push display style: $e');
    }
    return null;
  }

  Future<Object?> setConversationSilentMode() async {
    try {
      await EMClient.getInstance.pushManager.setConversationSilentMode(
          conversationId: conversationId,
          type: type,
          param: ChatSilentModeParam.remindType(remindType));
      debugPrint('Silent mode set for conversation: $conversationId');
      return true; // Indicate success
    } catch (e) {
      debugPrint('Error setting silent mode for conversation: $e');
    }
    return null;
  }

  Future<Object?> removeConversationSilentMode() async {
    try {
      await EMClient.getInstance.pushManager.removeConversationSilentMode(
          conversationId: conversationId, type: type);
      debugPrint('Silent mode removed for conversation: $conversationId');
      return true; // Indicate success
    } catch (e) {
      debugPrint('Error removing silent mode for conversation: $e');
    }
    return null;
  }

  Future<Object?> fetchConversationSilentMode() async {
    try {
      final silentMode = await EMClient.getInstance.pushManager
          .fetchConversationSilentMode(
              conversationId: conversationId, type: type);
      debugPrint('Fetched silent mode for conversation: $silentMode');
      return silentMode; // Return the fetched silent mode
    } catch (e) {
      debugPrint('Error fetching silent mode for conversation: $e');
    }
    return null;
  }

  Future<Object?> setSilentModeForAll() async {
    try {
      await EMClient.getInstance.pushManager.setSilentModeForAll(
          param: ChatSilentModeParam.remindType(remindType));
      debugPrint('Silent mode set for all conversations.');
      return true; // Indicate success
    } catch (e) {
      debugPrint('Error setting silent mode for all: $e');
    }
    return null;
  }

  Future<Object?> fetchSilentModeForAll() async {
    try {
      final silentMode =
          await EMClient.getInstance.pushManager.fetchSilentModeForAll();
      debugPrint('Fetched silent mode for all: $silentMode');
      return silentMode; // Return the fetched silent mode
    } catch (e) {
      debugPrint('Error fetching silent mode for all: $e');
    }
    return null;
  }

  Future<Object?> fetchSilentModeForConversations() async {
    try {
      final conversations =
          await EMClient.getInstance.chatManager.loadAllConversations();
      final subConversations = conversations.sublist(
          0, conversations.length < 10 ? conversations.length : 10);
      final result = await EMClient.getInstance.pushManager
          .fetchSilentModeForConversations(subConversations);
      debugPrint('Fetched silent mode for conversations.${result.map((key, value) => MapEntry(key, value.toString()))}');
      return result; // Return relevant data if implemented
    } catch (e) {
      debugPrint('Error fetching silent mode for conversations: $e');
    }
    return null;
  }

  Future<Object?> setPreferredNotificationLanguage() async {
    // Implement logic if needed
    debugPrint('setPreferredNotificationLanguage called');
    return null; // Return null or relevant data
  }

  Future<Object?> fetchPreferredNotificationLanguage() async {
    // Implement logic if needed
    debugPrint('fetchPreferredNotificationLanguage called');
    return null; // Return null or relevant data
  }

  Future<Object?> getPushTemplate() async {
    try {
      final template =
          await EMClient.getInstance.pushManager.getPushTemplate();
      debugPrint('Fetched push template: $template');
      return template; // Return the fetched template
    } catch (e) {
      debugPrint('Error fetching push template: $e');
    }
    return null;
  }

  Future<Object?> setPushTemplate() async {
    try {
      await EMClient.getInstance.pushManager.setPushTemplate('NewTemplate');
      debugPrint('Push template set to: NewTemplate');
      return 'NewTemplate'; // Return the new template name
    } catch (e) {
      debugPrint('Error setting push template: $e');
    }
    return null;
  }

  Future<Object?> syncSilentModels() async {
    try {
      await EMClient.getInstance
          .pushManager
          .syncConversationsSilentMode();
      debugPrint('Synchronized silent models from server.');
      return true; // Indicate success
    } catch (e) {
      debugPrint('Error synchronizing silent models: $e');
    }
    return null;
  }

  Future<Object?> bindDeviceToken() async {
    try {
      await EMClient.getInstance
          .pushManager
          .bindDeviceToken(notifierName: 'example_token', deviceToken: '');
      debugPrint('Device token bound.');
      return true; // Indicate success
    } catch (e) {
      debugPrint('Error binding device token: $e');
    }
    return null;
  }
}
