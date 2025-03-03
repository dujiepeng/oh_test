import 'package:flutter/material.dart';
import 'package:im_flutter_sdk/im_flutter_sdk.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_oh/item_page.dart';

// ignore: must_be_immutable
class GroupPage extends ItemsPage {
  GroupPage({super.key});

  String? groupId;

  @override
  List<Item>? get items => [
        Item(title: 'getGroupWithId', onTap: getGroupWithId),
        Item(title: 'getJoinedGroups', onTap: getJoinedGroups),
        Item(
            title: 'getJoinedGroupsFromServer',
            onTap: getJoinedGroupsFromServer),
        Item(
            title: 'getPublicGroupsFromServer',
            onTap: getPublicGroupsFromServer),
        Item(title: 'createGroup', onTap: createGroup),
        Item(
            title: 'getGroupSpecificationFromServer',
            onTap: getGroupSpecificationFromServer),
        Item(
            title: 'getGroupMemberListFromServer',
            onTap: getGroupMemberListFromServer),
        Item(
            title: 'getGroupMuteListFromServer',
            onTap: getGroupMuteListFromServer),
        Item(
            title: 'getGroupWhiteListFromServer',
            onTap: getGroupWhiteListFromServer),
        Item(
            title: 'isMemberInWhiteListFromServer',
            onTap: isMemberInWhiteListFromServer),
        Item(
            title: 'getGroupFileListFromServer',
            onTap: getGroupFileListFromServer),
        Item(
            title: 'getGroupAnnouncementFromServer',
            onTap: getGroupAnnouncementFromServer),
        Item(
            title: 'getGroupBlockListFromServer',
            onTap: getGroupBlockListFromServer),
        Item(title: 'addMembers', onTap: addMembers),
        Item(title: 'inviterUser', onTap: inviterUser),
        Item(title: 'removeMembers', onTap: removeMembers),
        Item(title: 'blockMembers', onTap: blockMembers),
        Item(title: 'unblockMembers', onTap: unblockMembers),
        Item(title: 'updateGroupSubject', onTap: updateGroupSubject),
        Item(title: 'updateDescription', onTap: updateDescription),
        Item(title: 'leaveGroup', onTap: leaveGroup),
        Item(title: 'destroyGroup', onTap: destroyGroup),
        Item(title: 'blockGroup', onTap: blockGroup),
        Item(title: 'unblockGroup', onTap: unblockGroup),
        Item(title: 'updateGroupOwner', onTap: updateGroupOwner),
        Item(title: 'addAdmin', onTap: addAdmin),
        Item(title: 'removeAdmin', onTap: removeAdmin),
        Item(title: 'muteMembers', onTap: muteMembers),
        Item(title: 'unMuteMembers', onTap: unMuteMembers),
        Item(title: 'muteAllMembers', onTap: muteAllMembers),
        Item(title: 'unMuteAllMembers', onTap: unMuteAllMembers),
        Item(title: 'addWhiteList', onTap: addWhiteList),
        Item(title: 'removeWhiteList', onTap: removeWhiteList),
        Item(
            title: 'uploadGroupSharedFile',
            onContextTap: uploadGroupSharedFile),
        Item(title: 'downloadGroupSharedFile', onTap: downloadGroupSharedFile),
        Item(title: 'removeGroupSharedFile', onTap: removeGroupSharedFile),
        Item(title: 'updateGroupAnnouncement', onTap: updateGroupAnnouncement),
        Item(title: 'updateGroupExt', onTap: updateGroupExt),
        Item(title: 'joinPublicGroup', onTap: joinPublicGroup),
        Item(
            title: 'requestToJoinPublicGroup', onTap: requestToJoinPublicGroup),
        Item(title: 'acceptJoinApplication', onTap: acceptJoinApplication),
        Item(title: 'declineJoinApplication', onTap: declineJoinApplication),
        Item(
            title: 'acceptInvitationFromGroup',
            onTap: acceptInvitationFromGroup),
        Item(
            title: 'declineInvitationFromGroup',
            onTap: declineInvitationFromGroup),
        Item(title: 'setMemberAttributes', onTap: setMemberAttributes),
        Item(title: 'removeMemberAttributes', onTap: removeMemberAttributes),
        Item(title: 'fetchMemberAttributes', onTap: fetchMemberAttributes),
        Item(title: 'fetchMembersAttributes', onTap: fetchMembersAttributes),
        Item(title: 'fetchJoinedGroupCount', onTap: fetchJoinedGroupCount),
        Item(title: 'clearAllGroupsFromDB', onTap: clearAllGroupsFromDB),
        Item(title: 'isMemberInGroupMuteList', onTap: isMemberInGroupMuteList),
      ];

  Future<Object?> getGroupWithId() async {
    try {
      return await EMClient.getInstance.groupManager.getGroupWithId('groupId');
    } catch (e) {
      return e;
    }
  }

  Future<Object?> getJoinedGroups() async {
    try {
      return await EMClient.getInstance.groupManager.getJoinedGroups();
    } catch (e) {
      return e;
    }
  }

  Future<Object?> getJoinedGroupsFromServer() async {
    try {
      return await EMClient.getInstance.groupManager
          .fetchJoinedGroupsFromServer();
    } catch (e) {
      return e;
    }
  }

  Future<Object?> getPublicGroupsFromServer() async {
    try {
      return await EMClient.getInstance.groupManager
          .fetchPublicGroupsFromServer(pageSize: 10, cursor: '1');
    } catch (e) {
      return e;
    }
  }

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

  Future<Object?> getGroupSpecificationFromServer() async {
    try {
      return await EMClient.getInstance.groupManager
          .fetchGroupInfoFromServer('groupId');
    } catch (e) {
      return e;
    }
  }

  Future<Object?> getGroupMemberListFromServer() async {
    try {
      return await EMClient.getInstance.groupManager.fetchMemberListFromServer(
        'groupId',
        cursor: "cursor",
        pageSize: 20,
      );
    } catch (e) {
      return e;
    }
  }

  Future<Object?> getGroupMuteListFromServer() async {
    try {
      return await EMClient.getInstance.groupManager.fetchMuteListFromServer(
        'groupId',
        pageNum: 1,
        pageSize: 20,
      );
    } catch (e) {
      return e;
    }
  }

  Future<Object?> getGroupWhiteListFromServer() async {
    try {
      return await EMClient.getInstance.groupManager.fetchAllowListFromServer(
        'groupId',
      );
    } catch (e) {
      return e;
    }
  }

  Future<Object?> isMemberInWhiteListFromServer() async {
    try {
      return await EMClient.getInstance.groupManager
          .isMemberInAllowListFromServer(
        'groupId',
      );
    } catch (e) {
      return e;
    }
  }

  Future<Object?> getGroupFileListFromServer() async {
    try {
      return await EMClient.getInstance.groupManager
          .fetchGroupFileListFromServer(
        'groupId',
        pageNum: 1,
        pageSize: 20,
      );
    } catch (e) {
      return e;
    }
  }

  Future<Object?> getGroupAnnouncementFromServer() async {
    try {
      return await EMClient.getInstance.groupManager
          .fetchAnnouncementFromServer('groupId');
    } catch (e) {
      return e;
    }
  }

  Future<Object?> getGroupBlockListFromServer() async {
    try {
      return await EMClient.getInstance.groupManager.fetchBlockListFromServer(
        'groupId',
        pageNum: 1,
        pageSize: 20,
      );
    } catch (e) {
      return e;
    }
  }

  Future<Object?> addMembers() async {
    try {
      await EMClient.getInstance.groupManager.addMembers(
        'groupId',
        ["du002"],
        welcome: 'hello',
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> inviterUser() async {
    try {
      await EMClient.getInstance.groupManager.inviterUser(
        'groupId',
        ["du002"],
        reason: 'hello',
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> removeMembers() async {
    try {
      await EMClient.getInstance.groupManager.removeMembers(
        'groupId',
        ["du002"],
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> blockMembers() async {
    try {
      await EMClient.getInstance.groupManager.blockMembers(
        'groupId',
        ["du002"],
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> unblockMembers() async {
    try {
      await EMClient.getInstance.groupManager.unblockMembers(
        'groupId',
        ["du002"],
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> updateGroupSubject() async {
    try {
      await EMClient.getInstance.groupManager.changeGroupName(
        'groupId',
        'newGroupName',
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> updateDescription() async {
    try {
      await EMClient.getInstance.groupManager.changeGroupDescription(
        'groupId',
        'newDescription',
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> leaveGroup() async {
    try {
      await EMClient.getInstance.groupManager.leaveGroup(
        'groupId',
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> destroyGroup() async {
    try {
      await EMClient.getInstance.groupManager.leaveGroup(
        'groupId',
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> blockGroup() async {
    try {
      await EMClient.getInstance.groupManager.blockGroup(
        'groupId',
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> unblockGroup() async {
    try {
      await EMClient.getInstance.groupManager.unblockGroup(
        'groupId',
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> updateGroupOwner() async {
    try {
      await EMClient.getInstance.groupManager.changeOwner(
        'groupId',
        'newOwner',
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> addAdmin() async {
    try {
      await EMClient.getInstance.groupManager.addAdmin(
        'groupId',
        'admin',
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> removeAdmin() async {
    try {
      await EMClient.getInstance.groupManager.removeAdmin(
        'groupId',
        'admin',
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> muteMembers() async {
    try {
      await EMClient.getInstance.groupManager.muteMembers(
        'groupId',
        ['du002'],
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> unMuteMembers() async {
    try {
      await EMClient.getInstance.groupManager.unMuteMembers(
        'groupId',
        ['du002'],
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> muteAllMembers() async {
    try {
      await EMClient.getInstance.groupManager.muteAllMembers(
        'groupId',
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> unMuteAllMembers() async {
    try {
      await EMClient.getInstance.groupManager.unMuteAllMembers(
        'groupId',
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> addWhiteList() async {
    try {
      await EMClient.getInstance.groupManager.addAllowList(
        'groupId',
        ['du002'],
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> removeWhiteList() async {
    try {
      await EMClient.getInstance.groupManager.removeAllowList(
        'groupId',
        ['du002'],
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> uploadGroupSharedFile(BuildContext context) async {
    try {
      final file = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (file == null) {
        return "file is null";
      }
      await EMClient.getInstance.groupManager.uploadGroupSharedFile(
        'groupId',
        file.path,
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> downloadGroupSharedFile() async {
    try {
      await EMClient.getInstance.groupManager.downloadGroupSharedFile(
        groupId: 'groupId',
        fileId: 'fileId',
        savePath: 'savePath',
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> removeGroupSharedFile() async {
    try {
      await EMClient.getInstance.groupManager.removeGroupSharedFile(
        'groupId',
        'fileId',
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> updateGroupAnnouncement() async {
    try {
      await EMClient.getInstance.groupManager.updateGroupAnnouncement(
        'groupId',
        'new announcement',
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> updateGroupExt() async {
    try {
      await EMClient.getInstance.groupManager.updateGroupExtension(
        'groupId',
        'new extension',
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> joinPublicGroup() async {
    try {
      await EMClient.getInstance.groupManager.joinPublicGroup(
        'groupId',
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> requestToJoinPublicGroup() async {
    try {
      await EMClient.getInstance.groupManager.requestToJoinPublicGroup(
        'groupId',
        reason: 'join reason',
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> acceptJoinApplication() async {
    try {
      await EMClient.getInstance.groupManager.acceptJoinApplication(
        'groupId',
        'userId',
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> declineJoinApplication() async {
    try {
      await EMClient.getInstance.groupManager.declineJoinApplication(
        'groupId',
        'userId',
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> acceptInvitationFromGroup() async {
    try {
      await EMClient.getInstance.groupManager.acceptInvitation(
        'groupId',
        'inviter',
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> declineInvitationFromGroup() async {
    try {
      await EMClient.getInstance.groupManager.declineInvitation(
        groupId: 'groupId',
        inviter: 'inviter',
        reason: "reason",
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> setMemberAttributes() async {
    try {
      await EMClient.getInstance.groupManager.setMemberAttributes(
        groupId: 'groupId',
        attributes: {'key': 'value'},
        userId: "du001",
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> removeMemberAttributes() async {
    try {
      await EMClient.getInstance.groupManager.removeMemberAttributes(
        groupId: 'groupId',
        keys: ['key'],
        userId: "du001",
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> fetchMemberAttributes() async {
    try {
      return await EMClient.getInstance.groupManager.fetchMemberAttributes(
        groupId: 'groupId',
        userId: "du001",
      );
    } catch (e) {
      return e;
    }
  }

  Future<Object?> fetchMembersAttributes() async {
    try {
      return await EMClient.getInstance.groupManager.fetchMembersAttributes(
        groupId: 'groupId',
        userIds: ["du001"],
      );
    } catch (e) {
      return e;
    }
  }

  Future<Object?> fetchJoinedGroupCount() async {
    try {
      return await EMClient.getInstance.groupManager.fetchJoinedGroupCount();
    } catch (e) {
      return e;
    }
  }

  Future<Object?> clearAllGroupsFromDB() async {
    try {
      await EMClient.getInstance.groupManager.clearAllGroupsFromLocal();
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> isMemberInGroupMuteList() async {
    try {
      return EMClient.getInstance.groupManager.isMemberInGroupMuteList();
    } catch (e) {
      return e;
    }
  }
}
