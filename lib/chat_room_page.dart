import 'package:flutter/material.dart';
import 'package:im_flutter_sdk/im_flutter_sdk.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_oh/item_page.dart';
import 'package:test_oh/translate_tool.dart';

// ignore: must_be_immutable
class ChatRoomPage extends ItemsPage {
  ChatRoomPage({super.key});

  @override
  ListenerCallback? get addListenerCallback => (BuildContext ctx) {
    EMClient.getInstance.chatRoomManager.addEventHandler(
      'identifier',
      EMChatRoomEventHandler(onAdminAddedFromChatRoom: (roomId, admin) {
        debugPrint('onAdminAddedFromChatRoom: $roomId>>$admin');
      },
        onAdminRemovedFromChatRoom: (roomId, admin) {
          debugPrint('onAdminRemovedFromChatRoom: $roomId>>$admin');
        },
        onAllChatRoomMemberMuteStateChanged: (roomId, isMuted) {
          debugPrint('onAllChatRoomMemberMuteStateChanged: $roomId>>$isMuted');
        },
        onAllowListAddedFromChatRoom: (roomId, userId) {
          debugPrint('onAllowListAddedFromChatRoom: $roomId>>$userId');
        },
        onAllowListRemovedFromChatRoom: (roomId, userId) {
          debugPrint('onAllowListRemovedFromChatRoom: $roomId>>$userId');
        },
        onAnnouncementChangedFromChatRoom: (roomId, announcement) {
          debugPrint('onAnnouncementChangedFromChatRoom: $roomId>>$announcement');
        },
        onChatRoomDestroyed: (roomId,roomName) {
          debugPrint('onChatRoomDestroyed: $roomId>>$roomName');
        },
        onMemberExitedFromChatRoom: (roomId, roomName,participant) {
          debugPrint('onMemberExitedFromChatRoom: $roomId>>$roomName>>$participant');
        },
        onMemberJoinedFromChatRoom: (roomId, participant,ext) {
          debugPrint('onMemberJoinedFromChatRoom: $roomId>>$participant>>$ext');
        },
        onMuteListAddedFromChatRoom: (roomId, userId) {
          debugPrint('onMuteListAddedFromChatRoom: $roomId>>$userId');
        },
        onMuteListRemovedFromChatRoom: (roomId, userId) {
          debugPrint('onMuteListRemovedFromChatRoom: $roomId>>$userId');
        },
        onOwnerChangedFromChatRoom: (roomId, newOwner,oldOwner) {
          debugPrint('onOwnerChangedFromChatRoom: $roomId>>$newOwner>>$oldOwner');
        },
        onRemovedFromChatRoom: (roomId, roomName,participant,reason) {
          debugPrint('onRemovedFromChatRoom: $roomId>>$roomName>>$participant>>$reason');
        },
        onSpecificationChanged: (roomId) {
          debugPrint('onSpecificationChanged: $roomId');
        },
        onAttributesUpdated: (roomId, attributes, from) {
          debugPrint('onAttributesUpdated: $roomId>>$attributes>>$from');
        },
        onAttributesRemoved: (roomId, removedKeys,from) {
          debugPrint('onAttributesRemoved: $roomId>>$removedKeys$from');
        },),
    );

    // EMClient.getInstance.chatManager.addMessageEvent(
    //   'identifier',
    //   ChatMessageEvent(
    //     onSuccess: (msgId, msg) {
    //       debugPrint('onSuccess: $msgId, $msg');
    //     },
    //     onError: (msgId, msg, e) {
    //       debugPrint('onError: $msgId, $msg, $e');
    //     },
    //     onProgress: (progress, status) {
    //       debugPrint('onProgress: $progress, $status');
    //     },
    //   ),
    // );
  };
  @override
  ListenerCallback? get removeListenerCallback => (ctx) {};

  @override
  String? get title => 'Chat Test';

  @override
  List<Item>? get items => getItems();

  List<Item> getItems() {
    final list = [
      Item(title: 'join Room:  Y', onTap: joinChatRoom),
      Item(title: 'leave Room: Y', onTap: leaveChatRoom),
      Item(title: 'fetchPublicChatRoomsFromServer: ', onTap: fetchPublicChatRoomsFromServer),
      // Item(title: 'fetchChatRoomInfoFromServer :无', onTap: fetchChatRoomInfoFromServer),
      // Item(title: 'getChatRoom', onContextTap: getChatRoom),
      // Item(title: 'getAllChatRooms', onTap: getAllChatRooms),
      // Item(title: 'destroyChatRoom：无', onTap: destroyChatRoom),
      // Item(title: 'changeChatRoomSubject', onTap: changeChatRoomSubject),
      Item(title: 'changeChatRoomDescription: Y', onTap: changeChatRoomDescription),
      Item(title: 'fetchChatRoomMembers：Y', onTap: fetchChatRoomMembers),
      Item(title: 'muteChatRoomMembers: Y', onTap: muteChatRoomMembers),
      Item(title: 'unMuteChatRoomMembers: Y', onTap: unMuteChatRoomMembers),
      Item(title: 'changeChatRoomOwner：Y', onTap: changeChatRoomOwner),
      Item(title: 'addChatRoomAdmin: Y', onTap: addChatRoomAdmin),
      Item(title: 'removeChatRoomAdmin: Y', onTap: removeChatRoomAdmin),
      Item(title: 'fetchChatRoomMuteList: Y', onTap: fetchChatRoomMuteList),
      Item(title: 'removeChatRoomMembers: Y', onTap: removeChatRoomMembers),
      Item(title: 'blockChatRoomMembers: Y', onTap: blockChatRoomMembers),
      Item(title: 'unBlockChatRoomMembers: Y', onTap: unBlockChatRoomMembers),
      Item(title: 'fetchChatRoomBlockList: N', onTap: fetchChatRoomBlockList),
      Item(title: 'updateChatRoomAnnouncement: Y', onTap: updateChatRoomAnnouncement),
      Item(title: 'fetchChatRoomAnnouncement:Y', onTap: fetchChatRoomAnnouncement),
      Item(title: 'addMembersToChatRoomWhiteList:Y', onTap: addMembersToChatRoomWhiteList),
      Item(title: 'removeMembersFromChatRoomWhiteList: Y', onTap: removeMembersFromChatRoomWhiteList),
      Item(title: 'isMemberInChatRoomWhiteListFromServer Y', onTap: isMemberInChatRoomWhiteListFromServer),
      Item(title: 'fetchChatRoomWhiteListFromServer: Y', onTap: fetchChatRoomWhiteListFromServer),
      Item(title: 'muteAllChatRoomsMembers: Y', onTap: muteAllChatRoomsMembers),
      Item(title: 'unMuteAllChatRoomsMembers: Y', onTap: unMuteAllChatRoomsMembers),
      Item(title: 'fetchChatRoomAttributes：无数据', onTap: fetchChatRoomAttributes),
      Item(title: 'setChatRoomAttributes: Y', onTap: setChatRoomAttributes),
      Item(title: 'removeChatRoomAttributes :Y', onTap: removeChatRoomAttributes),
    ];

    return list;
  }
  // joinChatRoom
  Future<void> joinChatRoom() async {
    try {
      await EMClient.getInstance.chatRoomManager.joinChatRoom('275094748332033');
      debugPrint('joinChatRoom success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> leaveChatRoom() async {
    try {
      await EMClient.getInstance.chatRoomManager.leaveChatRoom('275094748332033');
      debugPrint('leaveChatRoom success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<Object?> fetchPublicChatRoomsFromServer() async {
    try {
      var res = await EMClient.getInstance.chatRoomManager.fetchPublicChatRoomsFromServer(pageNum: 1,pageSize: 20);
      debugPrint('fetchPub licChatRoomsFromServer success  $res');
      return res;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> fetchChatRoomInfoFromServer() async {
    try {
      await EMClient.getInstance.chatRoomManager.fetchChatRoomInfoFromServer('275094748332033');
      debugPrint('fetchChatRoomInfoFromServer success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // Future<void> getChatRoom() async {
  //   try {
  //     await EMClient.getInstance.chatRoomManager.getChatRoom('275094748332033');
  //     debugPrint('getChatRoom success');
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

  // Future<void> getAllChatRooms() async {
  //   try {
  //     await EMClient.getInstance.chatRoomManager.getAllChatRooms();
  //     debugPrint('getAllChatRooms success');
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

  Future<void> destroyChatRoom() async {
    try {
      await EMClient.getInstance.chatRoomManager.destroyChatRoom('275094748332033');
      debugPrint('destroyChatRoom success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // Future<void> changeChatRoomSubject() async {
  //   try {
  //     await EMClient.getInstance.chatRoomManager.changeChatRoomSubject('275094748332033', 'New Subject');
  //     debugPrint('changeChatRoomSubject success');
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

  Future<void> changeChatRoomDescription() async {
    try {
      await EMClient.getInstance.chatRoomManager.changeChatRoomDescription('275094748332033', 'xiaowu002 修改了信息');
      debugPrint('changeChatRoomDescription success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> fetchChatRoomMembers() async {
    try {

      var res =  await EMClient.getInstance.chatRoomManager.fetchChatRoomMembers('275094748332033',cursor: '');
      // return res;
      debugPrint('muteChatRoomMembers success$res');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> muteChatRoomMembers() async {
    try {
      await EMClient.getInstance.chatRoomManager.muteChatRoomMembers('275094748332033',
      ['xiaowu001'],duration: 18000000);
      debugPrint('muteChatRoomMembers success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> unMuteChatRoomMembers() async {
    try {
      await EMClient.getInstance.chatRoomManager.unMuteChatRoomMembers('275094748332033', ['xiaowu001']);
      debugPrint('unMuteChatRoomMembers success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> changeChatRoomOwner() async {
    try {
      await EMClient.getInstance.chatRoomManager.changeOwner('275094748332033', 'xiaowu002');
      debugPrint('changeChatRoomOwner success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> addChatRoomAdmin() async {
    try {
      await EMClient.getInstance.chatRoomManager.addChatRoomAdmin('275094748332033', 'xiaowu001');
      debugPrint('addChatRoomAdmin success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> removeChatRoomAdmin() async {
    try {
      await EMClient.getInstance.chatRoomManager.removeChatRoomAdmin('275094748332033', 'xiaowu001');
      debugPrint('removeChatRoomAdmin success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<Object?> fetchChatRoomMuteList() async {
    try {
       var res = await EMClient.getInstance.chatRoomManager.fetchChatRoomMuteList('275094748332033');
       // print(res.runtimeType);
       return res;
       debugPrint('fetchChatRoomMuteList success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> removeChatRoomMembers() async {
    try {
      await EMClient.getInstance.chatRoomManager.removeChatRoomMembers('275094748332033', ['xiaowu001']);
      debugPrint('removeChatRoomMembers success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> blockChatRoomMembers() async {
    try {
      await EMClient.getInstance.chatRoomManager.blockChatRoomMembers('275094748332033', ['xiaowu001']);
      debugPrint('blockChatRoomMembers success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> unBlockChatRoomMembers() async {
    try {
      await EMClient.getInstance.chatRoomManager.unBlockChatRoomMembers('275094748332033', ['xiaowu001']);
      debugPrint('unBlockChatRoomMembers success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<Object?> fetchChatRoomBlockList() async {
    try {
      return await EMClient.getInstance.chatRoomManager.fetchChatRoomBlockList('275094748332033');
      debugPrint('fetchChatRoomBlockList success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> updateChatRoomAnnouncement() async {
    try {
      await EMClient.getInstance.chatRoomManager.updateChatRoomAnnouncement('275094748332033', 'New Announcement');
      debugPrint('updateChatRoomAnnouncement success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> fetchChatRoomAnnouncement() async {
    try {
      var res = await EMClient.getInstance.chatRoomManager.fetchChatRoomAnnouncement('275094748332033');
      debugPrint('fetchChatRoomAnnouncement success $res');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> addMembersToChatRoomWhiteList() async {
    try {
      // await EMClient.getInstance.chatRoomManager.addMembersToChatRoomWhiteList('275094748332033', ['member1', 'member2']);
      await EMClient.getInstance.chatRoomManager.addMembersToChatRoomAllowList(
          '275094748332033', ['xiaowu001']);
      debugPrint('addMembersToChatRoomWhiteList success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> removeMembersFromChatRoomWhiteList() async {
    try {
      await EMClient.getInstance.chatRoomManager
          .removeMembersFromChatRoomAllowList(
          '275094748332033', ['xiaowu002']);
      debugPrint('removeMembersFromChatRoomWhiteList success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> isMemberInChatRoomWhiteListFromServer() async {
    try {
     var res =  await EMClient.getInstance.chatRoomManager.isMemberInChatRoomAllowList('275094748332033');
      debugPrint('isMemberInChatRoomWhiteListFromServer success $res');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> fetchChatRoomWhiteListFromServer() async {
    try {
      var res = await EMClient.getInstance.chatRoomManager.fetchChatRoomAllowListFromServer('275094748332033');
      debugPrint('fetchChatRoomWhiteListFromServer success $res');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> muteAllChatRoomsMembers() async {
    try {
      await EMClient.getInstance.chatRoomManager.muteAllChatRoomMembers('275094748332033');
      debugPrint('muteAllChatRoomsMembers success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> unMuteAllChatRoomsMembers() async {
    try {
      await EMClient.getInstance.chatRoomManager.unMuteAllChatRoomMembers('275094748332033');
      debugPrint('unMuteAllChatRoomsMembers success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> fetchChatRoomAttributes() async {
    try {
      var res = await EMClient.getInstance.chatRoomManager.fetchChatRoomAttributes(roomId: '275094748332033',keys: ['value']);
      debugPrint('fetchChatRoomAttributes success  $res');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> setChatRoomAttributes() async {
    try {
      await EMClient.getInstance.chatRoomManager.addAttributes(
          '275094748332033',
          attributes: {'key': 'value'},

          deleteWhenLeft: true,
          overwrite: true);
      debugPrint('setChatRoomAttributes success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }



  Future<void> removeChatRoomAttributes() async {
    try {
      await EMClient.getInstance.chatRoomManager.removeAttributes('275094748332033', keys: ['key']);
      debugPrint('removeChatRoomAttributes success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
