import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:messenger/HomeScreen/Cards/CustomCard.dart';
import 'package:messenger/Models/ChatModel.dart';
import 'package:messenger/Models/MessageModel.dart';
import 'package:messenger/Models/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.user});

  final User user;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MessageModel> messagesModel = [];
  List<ChatModel> chatModels = [];
  final _searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chatModels = [
      ChatModel(
        c_name: "Виктор Власов",
        user_id: "1",
        c_id: "0",
        messages: [MessageModel(
        content: "Сделай мне кофе, пожалуйста",
        from_id: "0",
        c_id: "0",
        time: "21:41",
        date: "01.01.23"
      ),
      MessageModel(
        content: "Окей",
        from_id: "1",
        c_id: "0",
        time: "21:41",
        date: "01.01.23"
      ),
      MessageModel(
        content: "Уже сделал?",
        from_id: "0",
        c_id: "0",
        time: "21:41",
        date: "01.01.23"
      ),],
        avatar: "assets/avatars/avatar1.svg",
      ),
      ChatModel(
        c_name: "Саша Алексеев",
        user_id: "1",
        c_id: "0",
        messages: [
      MessageModel(
        content: "Я готов",
        from_id: "1",
        c_id: "1",
        time: "20:20",
        date: "01.01.23"
      ),],
        avatar: "assets/avatars/avatar2.svg",
      ),
      ChatModel(
        c_name: "Пётр Жаринов",
        user_id: "1",
        c_id: "0",
        messages: [
      MessageModel(
        content: "Я вышел",
        from_id: "0",
        c_id: "2",
        time: "9:41",
        date: "02.01.23"
      ),],
        avatar: "assets/avatars/avatar3.svg",
      ),
      ChatModel(
        c_name: "Алина Жукова",
        user_id: "1",
        c_id: "0",
        messages: [
      MessageModel(
        content: "Я вышел",
        from_id: "0",
        c_id: "3",
        time: "9:23",
        date: "03.01.23"
      ),],
        avatar: "assets/avatars/avatar4.svg",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 140.0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Чаты"),
              SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(237, 242, 246, 1),
                  focusColor: Color.fromRGBO(157, 183, 203, 1),
                  prefixIconColor: Color.fromRGBO(157, 183, 203, 1),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Поиск",
                  hintStyle: TextStyle(color: Color.fromRGBO(157, 183, 203, 1)),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 40,
                  ),
                ),
              )
            ],
          ),
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Color.fromRGBO(43, 51, 62, 1),
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
          elevation: 0.0,
          actions: [],
        ),
        body: ListView.builder(
            itemCount: chatModels.length,
            itemBuilder: (context, index) {
              return InkWell(
                child: CustomCard(
                  chatModel: chatModels[index],
                  user: widget.user,
                ),
              );
            }));
  }
}
