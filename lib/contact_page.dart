import 'package:im_flutter_sdk/im_flutter_sdk.dart';
import 'package:test_oh/item_page.dart';

// ignore: must_be_immutable
class ContactPage extends ItemsPage {
  ContactPage({super.key});

  @override
  List<Item>? get items {
    // 调用所有方法并用 Item 包装结果
    return [
      Item(title: 'addContact', onTap: addContact),
      Item(title: 'deleteContact', onTap: deleteContact),
      Item(title: 'getAllContactsFromServer', onTap: getAllContactsFromServer),
      Item(title: 'getAllContactsFromDB', onTap: getAllContactsFromDB),
      Item(title: 'addUserToBlockList', onTap: addUserToBlockList),
      Item(title: 'removeUserFromBlockList', onTap: removeUserFromBlockList),
      Item(title: 'getBlockListFromServer', onTap: getBlockListFromServer),
      Item(title: 'getBlockListFromDB', onTap: getBlockListFromDB),
      Item(title: 'acceptInvitation', onTap: acceptInvitation),
      Item(title: 'declineInvitation', onTap: declineInvitation),
      Item(
          title: 'getSelfIdsOnOtherPlatform', onTap: getSelfIdsOnOtherPlatform),
      Item(title: 'getAllContacts', onTap: getAllContacts),
      Item(title: 'setContactRemark', onTap: setContactRemark),
      Item(title: 'getContact', onTap: getContact),
      Item(title: 'fetchAllContacts', onTap: fetchAllContacts),
      Item(title: 'fetchContacts', onTap: fetchContacts),
    ];
  }

  Future<Object?> addContact() async {
    try {
      await EMClient.getInstance.contactManager.addContact('du003');
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> deleteContact() async {
    try {
      await EMClient.getInstance.contactManager.deleteContact('du003');
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> getAllContactsFromServer() async {
    try {
      return await EMClient.getInstance.contactManager
          .getAllContactsFromServer();
    } catch (e) {
      return e;
    }
  }

  Future<Object?> getAllContactsFromDB() async {
    try {
      return await EMClient.getInstance.contactManager.getAllContactsFromDB();
    } catch (e) {
      return e;
    }
  }

  Future<Object?> addUserToBlockList() async {
    try {
      await EMClient.getInstance.contactManager.addUserToBlockList('du003');
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> removeUserFromBlockList() async {
    try {
      await EMClient.getInstance.contactManager
          .removeUserFromBlockList('du003');
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> getBlockListFromServer() async {
    try {
      return await EMClient.getInstance.contactManager.fetchBlockIds();
    } catch (e) {
      return e;
    }
  }

  Future<Object?> getBlockListFromDB() async {
    try {
      return await EMClient.getInstance.contactManager.getBlockIds();
    } catch (e) {
      return e;
    }
  }

  Future<Object?> acceptInvitation() async {
    try {
      await EMClient.getInstance.contactManager.acceptInvitation("du003");
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> declineInvitation() async {
    try {
      await EMClient.getInstance.contactManager.declineInvitation("du003");
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> getSelfIdsOnOtherPlatform() async {
    try {
      await EMClient.getInstance.contactManager.getSelfIdsOnOtherPlatform();
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> getAllContacts() async {
    try {
      return await EMClient.getInstance.contactManager.getAllContacts();
    } catch (e) {
      return e;
    }
  }

  Future<Object?> setContactRemark() async {
    try {
      await EMClient.getInstance.contactManager.setContactRemark(
        userId: "du003",
        remark: "remark",
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> getContact() async {
    try {
      await EMClient.getInstance.contactManager.getContact(
        userId: "du003",
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Object?> fetchAllContacts() async {
    try {
      return await EMClient.getInstance.contactManager.fetchAllContacts();
    } catch (e) {
      return e;
    }
  }

  Future<Object?> fetchContacts() async {
    try {
      return await EMClient.getInstance.contactManager
          .fetchContacts(cursor: 'cursor', pageSize: 10);
    } catch (e) {
      return e;
    }
  }
}
