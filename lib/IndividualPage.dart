import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:messenger/ChatModel.dart';
import 'package:messenger/MessageModel.dart';
import 'package:messenger/OwnMessageCard.dart';
import 'package:messenger/ReplyCard.dart';
import 'package:messenger/user.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({Key? key, required this.chatModel, required this.user})
      : super(key: key);

  final ChatModel chatModel;
  final User user;

  @override
  _IndividualPageState createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  // bool showEmoji = false;


  bool sendButton = false;
  List<MessageModel> messages = [];
  List<int> targets_id = [];
  ScrollController _scrollController = ScrollController();

  

  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    messages.add(widget.chatModel.message);
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
              Icon(Icons.arrow_back, size: 24, color: Colors.black,),
              // CircleAvatar(
              //   child: SvgPicture.asset(
              //     "assets/person.svg",
              //     color: Colors.white,
              //     height: 34,
              //     width: 34,
              //   ),
              //   radius: 20,
              //   backgroundColor: Colors.blue[400],
              // ),
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
                  // color: Colors.white,
                  height: 50,
                  width: 50,
                ),
                radius: 20,
                backgroundColor: Color.fromARGB(0, 66, 164, 245),
              ),
              SizedBox(width: 10,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Text(widget.chatModel.c_name,
                        style:
                            TextStyle(fontSize: 18.5, fontWeight: FontWeight.bold, color: Colors.black),),
                    Text(
                      "В сети",
                      style: TextStyle(fontSize: 12, color: Color.fromRGBO(94, 122, 144, 1)),
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
              // height: messageListHeight,
              child: ListView.builder(
                shrinkWrap: true,
                controller: _scrollController,
                // itemCount: messages.length,

                itemCount: messages.length + 1,
                itemBuilder: (context, index) {
                  if (index == messages.length) {
                    return Container(
                      height: 68,
                    );
                  }
                  //поменять id
                  if (messages[index].from_id == "0") {
                    return OwnMessageCard(
                      message: messages[index].content,
                    );
                  } else {
                    return ReplyCard(
                      message: messages[index].content,
                    );
                  }
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 68,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(bottom: 8, right: 2, left: 2),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Color.fromRGBO(19, 30, 52, 1),
                            child: IconButton(
                              icon: Icon(
                                Icons.attach_file,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                if (sendButton == true &&
                                    _controller.text != '') {
                                  if (_scrollController.hasClients) {
                                    // _scrollController.jumpTo(_scrollController
                                    // .position.maxScrollExtent);

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
                        Container(
                          width: 280,
                          child: Card(
                            margin:
                                EdgeInsets.only(left: 2, right: 2, bottom: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextFormField(
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
                                // prefixIcon: IconButton(
                                //   icon: Icon(Icons.emoji_emotions),
                                //   onPressed: () {
                                //     setState((){
                                //       showEmoji != showEmoji;
                                //     });
                                //   },
                                // ),
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // IconButton(
                                    //   icon: Icon(Icons.attach_file),
                                    //   onPressed: () {
                                    //     showModalBottomSheet(
                                    //         backgroundColor: Colors.transparent,
                                    //         context: context,
                                    //         builder: (builder) =>
                                    //             bottomSheet());
                                    //   },
                                    // ),
                                    // IconButton(
                                    //   icon: Icon(Icons.camera_alt),
                                    //   onPressed: () {},
                                    // ),
                                  ],
                                ),
                                contentPadding: EdgeInsets.all(5),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(bottom: 8, right: 2, left: 2),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Color.fromRGBO(19, 30, 52, 1),
                            child: IconButton(
                              icon: Icon(
                                sendButton ? Icons.send : Icons.mic,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                if (sendButton == true &&
                                    _controller.text != '') {
                                  if (_scrollController.hasClients) {
                                    // _scrollController.jumpTo(_scrollController
                                    // .position.maxScrollExtent);

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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget bottomSheet() {
  //   return Container(
  //     height: 278,
  //     width: MediaQuery.of(context).size.width,
  //     child: Card(
  //       margin: EdgeInsets.all(18),
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
  //         child: Column(
  //           children: [
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 iconCreation(
  //                     Icons.insert_drive_file, Colors.indigo, "Document"),
  //                 SizedBox(
  //                   width: 40,
  //                 ),
  //                 iconCreation(Icons.camera_alt, Colors.pink, "Camera"),
  //                 SizedBox(
  //                   width: 40,
  //                 ),
  //                 iconCreation(Icons.insert_photo, Colors.purple, "Gallery"),
  //               ],
  //             ),
  //             SizedBox(
  //               height: 30,
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 iconCreation(Icons.headset, Colors.orange, "Audio"),
  //                 SizedBox(
  //                   width: 40,
  //                 ),
  //                 iconCreation(Icons.location_pin, Colors.teal, "Location"),
  //                 SizedBox(
  //                   width: 40,
  //                 ),
  //                 iconCreation(Icons.person, Colors.blue, "Contact"),
  //               ],
  //             ),
  //           ],
  //         ),
    //     ),
    //   ),
    // );
  // }

  // Widget iconCreation(IconData icon, Color color, String text) {
  //   return InkWell(
  //     onTap: () {
  //       if (text == 'Camera') {
  //         takePhoto(ImageSource.camera);
  //       }
  //     },
  //     child: Column(
  //       children: [
  //         CircleAvatar(
  //           radius: 30,
  //           backgroundColor: color,
  //           child: Icon(
  //             icon,
  //             color: Colors.white,
  //             size: 29,
  //           ),
  //         ),
  //         SizedBox(
  //           height: 5,
  //         ),
  //         Text(
  //           text,
  //           style: TextStyle(fontSize: 12),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();

  //   _scrollController.dispose();

  //   socket.close();
  // }

  // void takePhoto(ImageSource imgSource) async {
  //   final pickedFile = await _picker.getImage(source: imgSource);
  //   setState(() {
  //     _imageFile = pickedFile!;
  //   });
  // }
  // Widget emojiSelect() {
  //   return EmojiPicker(
  //       rows: 4,
  //       columns: 7,
  //       onEmojiSelected: (emoji, category) {
  //         print(emoji);
  //       });
  // }
}
