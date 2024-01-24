import 'package:messenger/MessageModel.dart';

class ChatModel {
  String avatar;
  String c_name;
  String user_id;
  String c_id;
  MessageModel message;

  ChatModel({
    required this.c_name,
    required this.user_id,
    required this.c_id,
    required this.message,
    required this.avatar,
  });
}
