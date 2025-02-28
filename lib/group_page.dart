import 'package:flutter/material.dart';
import 'package:im_flutter_sdk/im_flutter_sdk.dart';
import 'package:test_oh/item_page.dart';

// ignore: must_be_immutable
class GroupPage extends ItemsPage {
  GroupPage({super.key});

  String? groupId;

  @override
  List<Item>? get items => [
        Item(title: 'createGroup', onTap: createGroup),
        Item(title: 'getGroupInfo', onTap: getGroupInfo),
        Item(title: 'destroyGroup', onTap: destroyGroup),
      ];

  Future<Object?> createGroup() async {
    try {
      final group = await EMClient.getInstance.groupManager.createGroup(
        groupName: 'groupName',
        desc: 'group desc',
        inviteMembers: ["du002"],
        inviteReason: 'test',
        options: EMGroupOptions(
          style: EMGroupStyle.PrivateOnlyOwnerInvite,
        ),
      );

      groupId = group.groupId;
      return group;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> getGroupInfo() async {
    try {
      final info = await EMClient.getInstance.groupManager
          .fetchGroupInfoFromServer(groupId!);
      debugPrint(info.name);
      return info;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> destroyGroup() async {
    try {
      await EMClient.getInstance.groupManager.destroyGroup(groupId!);
      return 'success';
    } catch (e) {
      return e;
    }
  }
}
