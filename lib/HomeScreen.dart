import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:messenger/ChatModel.dart';
import 'package:messenger/CustomCard.dart';
import 'package:messenger/MessageModel.dart';
import 'package:messenger/SearchBar.dart';
import 'package:messenger/user.dart';

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
    messagesModel = [
      MessageModel(
        content: "Уже сделал?",
        from_id: "0",
        c_id: "0",
      ),
      MessageModel(
        content: "Уже сделал?",
        from_id: "0",
        c_id: "0",
      ),
    ];
    chatModels = [
      ChatModel(
        c_name: "Виктор Власов",
        user_id: "1",
        c_id: "0",
        message: messagesModel[0],
        avatar: "assets/avatars/avatar1.svg",
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
                    borderSide: BorderSide.none, // Убираем рамку
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
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (builder) => CreateGroup(),
        //       ),
        //     );
        // },
        //   backgroundColor: Colors.blue[400],
        //   child: Icon(Icons.chat, color: Colors.white),
        // ),
        body: ListView.builder(
            itemCount: chatModels.length,
            itemBuilder: (context, index) {
              return InkWell(
                child: CustomCard(
                  chatModel: chatModels[index],
                  user: widget.user,
                ),
              );
              // separatorBuilder: (context, i) => Divider(),
            }));
  }
}
