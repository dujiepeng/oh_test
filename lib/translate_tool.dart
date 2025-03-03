import 'package:im_flutter_sdk/im_flutter_sdk.dart';

extension ConversationExtension on EMConversation {
  String toJsonString() {
    return '{"type": ${type.index},'
        '"conversationId": "$id",'
        '"isPinned": $isPinned,'
        '"pinnedTime": $pinnedTime,'
        '"marks": $marks}';
  }
}

extension ResultExtension on EMCursorResult {
  String toJsonString() {
    return '{"cursor": "$cursor",'
        '"count": ${data.length},'
        '"data": ${toString()}';
  }
}
