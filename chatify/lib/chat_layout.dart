import 'package:chatify/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChatLayout extends StatefulWidget {
  final String listImage;
  final String listTitle;
  final String listNumber;

  const ChatLayout({
    super.key,
    required this.listImage,
    required this.listTitle,
    required this.listNumber,
  });

  @override
  State<ChatLayout> createState() => _ChatLayoutState();
}

class _ChatLayoutState extends State<ChatLayout> {
  final TextEditingController _controller = TextEditingController();
  List<String> chatData = [];
  DateTime now = DateTime.now();
  String period = DateTime.now().hour >= 12 ? 'PM' : 'AM';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Color(0xff65b9ac),
        leadingWidth: 97,
        leading: Row(
          children: [
            // Icon(Icons.arrow_back),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: Colors.white),
            ),
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35.0),
                border: Border.all(color: Colors.white),
              ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget.listImage),
              ),
            ),
          ],
        ),
        title: InkWell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.listTitle, style: TextStyle(color: Colors.white)),
              Text(
                widget.listNumber,
                style: TextStyle(color: Colors.white60, fontSize: 14),
              ),
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => ProfilePage(
                      imageUrl: widget.listImage,
                      titleText: widget.listTitle,
                      numberText: widget.listNumber,
                    ),
              ),
            );
          },
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'Clear') {
                setState(() {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        backgroundColor: Colors.transparent,
                        child: SizedBox(
                          width: 250,
                          height: 170,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Clear this chat?',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Are you sure you want to clear your all messages?',
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 85,
                                      top: 2,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {});
                                            chatData.clear();
                                            Fluttertoast.showToast(
                                              msg: 'Chat Deleted!',
                                            );
                                            Navigator.pop(context);
                                          },
                                          child: Text('Clear chat'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                });
              } else if (value == 'Settings') {
                setState(() {
                  Fluttertoast.showToast(msg: 'Clicked: $value');
                });
              }
            },
            itemBuilder:
                (context) => const [
                  PopupMenuItem(value: 'Settings', child: Text('Settings')),
                  PopupMenuItem(value: 'Edit', child: Text('Edit')),
                  PopupMenuItem(
                    value: 'Clear',
                    child: Row(
                      children: [
                        Icon(
                          Icons.cleaning_services_rounded,
                          color: Colors.red,
                          size: 15,
                        ),
                        SizedBox(width: 7),
                        Text('Clear Chat', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                ],
            icon: Icon(Icons.more_vert, color: Colors.white),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: chatData.length,
                padding: const EdgeInsets.all(8),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 160.0),
                      child: Container(
                        width: 60,
                        height: 60,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 18,
                                  left: 7,
                                ),
                                child: Text(chatData[index]),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 120,
                                  bottom: 5,
                                  top: 5,
                                ),
                                child: Text(
                                  '${now.hour}:${now.minute} $period',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            topRight: Radius.circular(15.0),
                            topLeft: Radius.circular(10.0),
                          ),
                          color: Color(0x3a51ff71),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                bottom: 15,
                top: 10,
                right: 10,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Message',
                        isDense: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade600,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        prefixIcon: const Icon(
                          CupertinoIcons.chat_bubble_text_fill,
                        ),
                        suffixIcon: IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: Color(0xff65b9ac),
                            side: BorderSide(color: Colors.black),
                          ),
                          icon: const Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 22,
                          ),
                          onPressed: () {
                            setState(() {});
                            if (_controller == null ||
                                _controller.text.isEmpty) {
                              Fluttertoast.showToast(msg: 'Write Something ?');
                            } else {
                              chatData.add(_controller.text);
                              _controller.clear();
                            }
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
