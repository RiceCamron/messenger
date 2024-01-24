import 'package:flutter/material.dart';
import 'package:messenger/ChatModel.dart';
import 'package:messenger/IndividualPage.dart';
import 'package:messenger/user.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.chatModel, required this.user})
      : super(key: key);

  final ChatModel chatModel;
  final User user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IndividualPage(
              chatModel: chatModel,
              user: user,
            ),
          ),
        );
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 20,
              child: SvgPicture.asset(
                chatModel.avatar,
                // color: Colors.white,
                height: 50,
                width: 50,
              ),
              backgroundColor: Color.fromARGB(0, 66, 164, 245),
            ),
            title: Text(
              chatModel.c_name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
                children: [
                  Text(chatModel.message.content),
                  SizedBox(
                    width: 3,
                  ),
                  Icon(Icons.done_all),
                  SizedBox(
                    width: 3,
                  ),
                ],
                ),
          ),
        ],
      ),
    );
  }
}
