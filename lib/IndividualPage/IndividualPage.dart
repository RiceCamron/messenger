import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:messenger/Models/ChatModel.dart';
import 'package:messenger/Models/MessageModel.dart';
import 'package:messenger/IndividualPage/Cards/OwnMessageCard.dart';
import 'package:messenger/IndividualPage/Cards/ReplyCard.dart';
import 'package:messenger/Models/user.dart';
import 'dart:math';

class IndividualPage extends StatefulWidget {
  const IndividualPage({Key? key, required this.chatModel, required this.user})
      : super(key: key);

  final ChatModel chatModel;
  final User user;

  @override
  _IndividualPageState createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool sendButton = false;
  List<MessageModel> messages = [];
  List<int> targets_id = [];
  ScrollController _scrollController = ScrollController();

  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    messages = widget.chatModel.messages;
  }

  @override
  Widget build(BuildContext context) {
    double messageListHeight = MediaQuery.of(context).size.height - 150;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        leadingWidth: 70,
        titleSpacing: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_back_ios,
                size: 24,
                color: Colors.black,
              ),
            ],
          ),
        ),
        title: InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(6),
            child: Row(
              children: [
                CircleAvatar(
                  child: SvgPicture.asset(
                    widget.chatModel.avatar,
                    height: 50,
                    width: 50,
                  ),
                  radius: 20,
                  backgroundColor: Color.fromARGB(0, 66, 164, 245),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.chatModel.c_name,
                      style: TextStyle(
                          fontSize: 18.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      "В сети",
                      style: TextStyle(
                          fontSize: 12, color: Color.fromRGBO(94, 122, 144, 1)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                controller: _scrollController,
                reverse: true,
                itemCount: messages.length + 1,
                itemBuilder: (context, index) {
                  if (index == messages.length) {
                    return Container(
                      height: 68,
                    );
                  }
                  final reversedIndex =
                      messages.length - 1 - index;
                  if (messages[reversedIndex].from_id == "0") {
                    return OwnMessageCard(
                      message: messages[reversedIndex],
                    );
                  } else {
                    return ReplyCard(
                      message: messages[reversedIndex],
                    );
                  }
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Color.fromRGBO(237, 242, 246, 1),
                      width: 1.0,
                    ),
                  ),
                ),
                height: 78,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(bottom: 8, right: 5, left: 5),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(237, 242, 246, 1),
                            ),
                            child: Transform.rotate(
      angle: 45 * pi / 180, // Наклон на 10 градусов
      child: IconButton(
        icon: Icon(
          Icons.attach_file,
          color: Colors.black,
        ),
        onPressed: () {},
      ),
    ),

                          ),
                        ),
                        Container(
                          width: 280,
                          child: Card(
                            margin:
                                EdgeInsets.only(left: 2, right: 2, bottom: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextField(
                              controller: _controller,
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.multiline,
                              minLines: 1,
                              maxLines: 5,
                              onChanged: (value) {
                                messageListHeight =
                                    MediaQuery.of(context).size.height - 600;
                                if (value.length > 0) {
                                  setState(() {
                                    sendButton = true;
                                  });
                                } else {
                                  setState(() {
                                    sendButton = false;
                                  });
                                }
                              },
                              decoration: InputDecoration(
                                hintText: "Сообщение",
                                contentPadding: EdgeInsets.all(15),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(bottom: 8, right: 2, left: 2),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(237, 242, 246, 1),
                            ),
                            child: IconButton(
                              icon: Icon(
                                sendButton ? Icons.send : Icons.mic,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                if (sendButton == true &&
                                    _controller.text != '') {
                                  if (_scrollController.hasClients) {
                                    _scrollController.animateTo(
                                        _scrollController
                                            .position.maxScrollExtent,
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeOut);
                                  }
                                  _controller.clear();
                                  sendButton = false;
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
