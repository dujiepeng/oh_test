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
        Item(title: 'getGroupWithId: Y', onTap: getGroupWithId),
        Item(title: 'getJoinedGroups: Y', onTap: getJoinedGroups),
        Item(
            title: 'getJoinedGroupsFromServer: Y',
            onTap: getJoinedGroupsFromServer),
        Item(
            title: 'getPublicGroupsFromServer: Y',
            onTap: getPublicGroupsFromServer),
        Item(title: 'createGroup: Y', onTap: createGroup),
        Item(
            title: 'getGroupSpecificationFromServer: Y',
            onTap: getGroupSpecificationFromServer),
        Item(
            title: 'getGroupMemberListFromServer: Y',
            onTap: getGroupMemberListFromServer),
        Item(
            title: 'getGroupMuteListFromServer: Y',
            onTap: getGroupMuteListFromServer),
        Item(
            title: 'getGroupWhiteListFromServer: Y',
            onTap: getGroupWhiteListFromServer),
        Item(
            title: 'isMemberInWhiteListFromServer: Y',
            onTap: isMemberInWhiteListFromServer),
        Item(
            title: 'getGroupFileListFromServer: Y',
            onTap: getGroupFileListFromServer),
        Item(
            title: 'getGroupAnnouncementFromServer: Y',
            onTap: getGroupAnnouncementFromServer),
        Item(
            title: 'getGroupBlockListFromServer: Y',
            onTap: getGroupBlockListFromServer),
        Item(title: 'addMembers: Y', onTap: addMembers),
        Item(title: 'inviterUser: Y', onTap: inviterUser),
        Item(title: 'removeMembers: Y', onTap: removeMembers),
        Item(title: 'blockMembers: Y', onTap: blockMembers),
        Item(title: 'unblockMembers: Y', onTap: unblockMembers),
        Item(title: 'updateGroupSubject: Y', onTap: updateGroupSubject),
        Item(title: 'updateDescription: Y', onTap: updateDescription),
        Item(title: 'leaveGroup: Y', onTap: leaveGroup),
        Item(title: 'destroyGroup: Y', onTap: destroyGroup),
        Item(title: 'blockGroup: Y', onTap: blockGroup),
        Item(title: 'unblockGroup: Y', onTap: unblockGroup),
        Item(title: 'updateGroupOwner: Y', onTap: updateGroupOwner),
        Item(title: 'addAdmin: Y', onTap: addAdmin),
        Item(title: 'removeAdmin: Y', onTap: removeAdmin),
        Item(title: 'muteMembers: Y', onTap: muteMembers),
        Item(title: 'unMuteMembers: Y', onTap: unMuteMembers),
        Item(title: 'muteAllMembers: Y', onTap: muteAllMembers),
        Item(title: 'unMuteAllMembers: Y', onTap: unMuteAllMembers),
        Item(title: 'addWhiteList: Y', onTap: addWhiteList),
        Item(title: 'removeWhiteList: Y', onTap: removeWhiteList),
        Item(
            title: 'uploadGroupSharedFile: Y',
            onContextTap: uploadGroupSharedFile),
        // 待使用 fileId 095d2510-f80c-11ef-a6d6-eb621e7bfbfe
        Item(
            title: 'downloadGroupSharedFile: 未验证',
            onTap: downloadGroupSharedFile),
        Item(title: 'removeGroupSharedFile: Y', onTap: removeGroupSharedFile),
        Item(
            title: 'updateGroupAnnouncement: Y',
            onTap: updateGroupAnnouncement),
        Item(title: 'updateGroupExt', onTap: updateGroupExt),
        Item(title: 'joinPublicGroup: Y', onTap: joinPublicGroup),
        Item(
            title: 'requestToJoinPublicGroup: Y',
            onTap: requestToJoinPublicGroup),
        Item(title: 'acceptJoinApplication', onTap: acceptJoinApplication),
        Item(title: 'declineJoinApplication', onTap: declineJoinApplication),
        Item(
            title: 'acceptInvitationFromGroup',
            onTap: acceptInvitationFromGroup),
        Item(
            title: 'declineInvitationFromGroup',
            onTap: declineInvitationFromGroup),
        Item(title: 'setMemberAttributes: Y', onTap: setMemberAttributes),
        Item(title: 'removeMemberAttributes: Y', onTap: removeMemberAttributes),
        Item(title: 'fetchMemberAttributes: Y', onTap: fetchMemberAttributes),
        Item(title: 'fetchMembersAttributes: Y', onTap: fetchMembersAttributes),
        Item(title: 'fetchJoinedGroupCount: Y', onTap: fetchJoinedGroupCount),
        Item(title: 'clearAllGroupsFromDB', onTap: clearAllGroupsFromDB),
        Item(
            title: 'isMemberInGroupMuteList: Y',
            onTap: isMemberInGroupMuteList),
      ];

  Future<Object?> getGroupWithId() async {
    try {
      return await EMClient.getInstance.groupManager
          .getGroupWithId('274297629245443');
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
          .fetchGroupInfoFromServer('274297629245443');
    } catch (e) {
      return e;
    }
  }

  Future<Object?> getGroupMemberListFromServer() async {
    try {
      return await EMClient.getInstance.groupManager.fetchMemberListFromServer(
        '274297629245443',
        cursor: "",
        pageSize: 20,
      );
    } catch (e) {
      return e;
    }
  }

  Future<Object?> getGroupMuteListFromServer() async {
    try {
      return await EMClient.getInstance.groupManager.fetchMuteListFromServer(
        '274297629245443',
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
        '274297629245443',
      );
    } catch (e) {
      return e;
    }
  }

  Future<Object?> isMemberInWhiteListFromServer() async {
    try {
      return await EMClient.getInstance.groupManager
          .isMemberInAllowListFromServer(
        '274297629245443',
      );
    } catch (e) {
      return e;
    }
  }

  Future<Object?> getGroupFileListFromServer() async {
    try {
      return await EMClient.getInstance.groupManager
          .fetchGroupFileListFromServer(
        '274297629245443',
        pageNum: 1,
        pageSize: 20,
      );
    } catch (e) {
      return e;
    }
  }

  Future<Object?> getGroupAnnouncementFromServer() async {
    try {
      final ret = await EMClient.getInstance.groupManager
          .fetchAnnouncementFromServer('274297629245443');
      return ret;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> getGroupBlockListFromServer() async {
    try {
      return await EMClient.getInstance.groupManager.fetchBlockListFromServer(
        '274297629245443',
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
        '274297629245443',
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
        '274297629245443',
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
        '274297629245443',
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
        '274297629245443',
        ["du003"],
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> unblockMembers() async {
    try {
      await EMClient.getInstance.groupManager.unblockMembers(
        '274297629245443',
        ["du003"],
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> updateGroupSubject() async {
    try {
      await EMClient.getInstance.groupManager.changeGroupName(
        '274297629245443',
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
        '274297629245443',
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
        '274298061258760',
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> destroyGroup() async {
    try {
      await EMClient.getInstance.groupManager.destroyGroup(
        '274017735999493',
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> blockGroup() async {
    try {
      await EMClient.getInstance.groupManager.blockGroup(
        '274298061258760',
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> unblockGroup() async {
    try {
      await EMClient.getInstance.groupManager.unblockGroup(
        '274298061258760',
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> updateGroupOwner() async {
    try {
      await EMClient.getInstance.groupManager.changeOwner(
        '274017595490308',
        'du002',
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> addAdmin() async {
    try {
      await EMClient.getInstance.groupManager.addAdmin(
        '274297629245443',
        'du002',
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> removeAdmin() async {
    try {
      await EMClient.getInstance.groupManager.removeAdmin(
        '274297629245443',
        'du002',
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> muteMembers() async {
    try {
      await EMClient.getInstance.groupManager.muteMembers(
        '274297629245443',
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
        '274297629245443',
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
        '274297629245443',
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> unMuteAllMembers() async {
    try {
      await EMClient.getInstance.groupManager.unMuteAllMembers(
        '274297629245443',
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> addWhiteList() async {
    try {
      await EMClient.getInstance.groupManager.addAllowList(
        '274297629245443',
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
        '274297629245443',
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
        '274297629245443',
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
        groupId: '274297629245443',
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
        '274297629245443',
        '370b3ee0-f80a-11ef-ae77-b7cc467eacea',
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> updateGroupAnnouncement() async {
    try {
      await EMClient.getInstance.groupManager.updateGroupAnnouncement(
        '274297629245443',
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
        '274297629245443',
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
        '274298061258760',
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> requestToJoinPublicGroup() async {
    try {
      await EMClient.getInstance.groupManager.requestToJoinPublicGroup(
        '274298061258760',
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
        groupId: '274297629245443',
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
        groupId: '274297629245443',
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
        groupId: '274297629245443',
        userId: "du001",
      );
    } catch (e) {
      return e;
    }
  }

  Future<Object?> fetchMembersAttributes() async {
    try {
      return await EMClient.getInstance.groupManager.fetchMembersAttributes(
        groupId: '274297629245443',
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
      return EMClient.getInstance.groupManager
          .isMemberInGroupMuteList('274297629245443');
    } catch (e) {
      return e;
    }
  }
}
