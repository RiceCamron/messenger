import 'package:messenger/Models/MessageModel.dart';

class ChatModel {
  String avatar;
  String c_name;
  String user_id;
  String c_id;
  List<MessageModel> messages;

  ChatModel({
    required this.c_name,
    required this.user_id,
    required this.c_id,
    required this.messages,
    required this.avatar,
  });
}
