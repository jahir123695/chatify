import 'dart:async';

import 'package:chatify/add_contact_layout.dart';
import 'package:chatify/chat_layout.dart';
import 'package:chatify/hero_image_layout.dart';
import 'package:chatify/list_data.dart';
import 'package:chatify/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatifyMainLayout extends StatelessWidget {
  const ChatifyMainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Chatify());
  }
}

class Chatify extends StatefulWidget {
  const Chatify({super.key});

  @override
  State<Chatify> createState() => _ChatifyState();
}

class _ChatifyState extends State<Chatify> {
  var _controller=TextEditingController();

  //search kiya gya data iss list me store hoga aur sirf wo dikhega
  List<ListData> filteredList = [];

  //user textfield me jo bhi likhega isme store hoga
  String searchText = "";

  // Jab app start ho to list ke sara data dikhe
  @override
  void initState() {
    super.initState();
    filteredList = dataList;
  }

  void updateSearch(String value) {
    setState(() {
      searchText = value.toLowerCase();
      filteredList =
          dataList
              .where((item) => item.title.toLowerCase().contains(searchText))
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 120,
        flexibleSpace: Container(
          width: MediaQuery.of(context).size.width,
          height: 145,
          decoration: BoxDecoration(
            color: Color(0xff65b9ac),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25.0),
              bottomLeft: Radius.circular(25.0),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 45.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '|            Chat with Chatify',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      CupertinoIcons.chat_bubble_text_fill,
                      color: Colors.white,
                      size: 20,
                    ),
                    Text(
                      '            |',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 35,
                  right: 35,
                  top: 10,
                  bottom: 10,
                ),
                child: TextFormField(
                  controller: _controller,
                  onChanged: updateSearch,
                  cursorColor: Color(0xff65b9ac),
                  decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: Icon(CupertinoIcons.search),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _controller.clear();
                          filteredList=dataList;
                        });
                      },
                      icon: Icon(CupertinoIcons.clear),
                    ),
                    hintText: 'Search..',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: filteredList.length,
        itemBuilder: (context, index) {
          var listItem = filteredList[index];
          return ListTile(
            leading: InkWell(
              child: Hero(
                tag: 'hero_$index',
                child: CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(listItem.image),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => HeroImageLayout(imageUrl: listItem.image,heroTag: 'hero_$index',),
                  ),
                );
              },
            ),
            title: Text(
              listItem.title,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            onTap: () {
              HapticFeedback.selectionClick();
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChatLayout(listImage: listItem.image, listTitle: listItem.title,listNumber: listItem.subTitle,),));
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 5,
              bottom: 5,
            ),
            child: Container(width: 200, height: 0.5, color: Color(0xff65b9ac)),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(backgroundColor: Color(0xff65b9ac),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddContactLayout(),));
      },child: Icon(Icons.add_comment_rounded,color: Colors.white,),),
    );
  }
}
