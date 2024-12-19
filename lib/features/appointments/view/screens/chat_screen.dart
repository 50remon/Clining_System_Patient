import 'package:clinic_system_patient/core/resources/color_manager.dart';
import 'package:clinic_system_patient/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../data/models/appointments_model.dart';
import '../widgets/message_bubble.dart';
import '../widgets/message_input.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> messages = [];

  @override
  Widget build(BuildContext context) {
    AppointmentsModel args =
        ModalRoute.of(context)!.settings.arguments as AppointmentsModel;
    messages = [
      Message(sender: 'انت', text: 'سلام عليكم!'),
      Message(
          sender: args.docName, text: 'و عليكم السلام و رحمة الله و بركاته'),
      Message(sender: 'انت', text: 'I am good, thanks!'),
      Message(sender: 'انت', text: 'Hello!'),
      Message(sender: args.docName, text: 'Hi there! How are you?'),
      Message(sender: 'انت', text: 'I am good, thanks!'),
      Message(sender: 'انت', text: 'Hello!'),
      Message(sender: args.docName, text: 'Hi there! How are you?'),
      Message(sender: 'انت', text: 'I am good, thanks!'),
      // Add more messages here
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        leadingWidth: 150.w,
        toolbarHeight: Sizes.s100.h,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.r),
          bottomRight: Radius.circular(25.r),
        )),
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const ImageIcon(
                size: 24,
                AssetImage(ImageAssets.arrowBack),
              ),
            ),
            CircleAvatar(
              radius: 26.3,
              backgroundColor: ColorManager.black,
              child: CircleAvatar(
                radius: 25,
                backgroundColor: ColorManager.white,
                child: Image.asset(
                  args.imageDoc!,
                  height: 50.h,
                ),
              ),
            ),
          ],
        ),
        centerTitle: false,
        title: Text(
          args.docName,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const ImageIcon(
              AssetImage(
                ImageAssets.phoneCallChat,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const ImageIcon(
              AssetImage(
                ImageAssets.videoCallChat,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return MessageBubble(message: messages[index]);
              },
            ),
          ),
          MessageInput(),
        ],
      ),
    );
  }
}
