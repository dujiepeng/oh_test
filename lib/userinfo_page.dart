import 'package:flutter/material.dart';
import 'package:im_flutter_sdk/im_flutter_sdk.dart';
import 'package:test_oh/item_page.dart';

class UserInfoPage extends ItemsPage {
  UserInfoPage({super.key});

  List<String> userIds = ['lxm', 'ljn', 'som']; // Example user IDs

  @override
  List<Item>? get items => [
        Item(title: 'updateOwnUserInfo: Y', onTap: updateOwnUserInfo),
        Item(
            title: 'updateOwnUserInfoWithType: X',
            onTap: updateOwnUserInfoWithType),
        Item(title: 'fetchUserInfoById: Y', onTap: fetchUserInfoById),
        Item(
            title: 'fetchUserInfoByIdWithType: X',
            onTap: fetchUserInfoByIdWithType),
      ];

  Future<Object?> updateOwnUserInfo() async {
    try {
      final userInfo = await EMClient.getInstance.userInfoManager.updateUserInfo(nickname: 'New nickname');
      debugPrint('User info updated: ${userInfo.toJson()}');
      return userInfo;
    } catch (e) {
      debugPrint('Error updating own user info: $e');
    }
    return null;
  }

  Future<Object?> updateOwnUserInfoWithType() async {
    return null;
  }

  Future<Object?> fetchUserInfoById() async {
    try {
      final userInfoMap =
          await EMClient.getInstance.userInfoManager.fetchUserInfoById(userIds);
      debugPrint(
          'Fetched user info by ID: ${userInfoMap.map((key, value) => MapEntry(key, value.toJson()))}');
      return userInfoMap;
    } catch (e) {
      debugPrint('Error fetching user info by ID: $e');
    }
    return null;
  }

  Future<Object?> fetchUserInfoByIdWithType() async {
    return null;
  }
}
