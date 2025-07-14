import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfilePage extends StatefulWidget {
  final String imageUrl;
  final String titleText;
  final String numberText;

  const ProfilePage({
    super.key,
    required this.imageUrl,
    required this.titleText,
    required this.numberText,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        flexibleSpace: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: Color(0x7465b9ac))),
          ),
        ),
        title: Text('Profile page'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 280,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Column(
              children: [
                SizedBox(height: 15),
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey,
                    border: Border.all(color: Color(0x7465b9ac), width: 2),
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(widget.imageUrl),
                  ),
                ),
                SizedBox(height: 10),
                Text(widget.titleText, style: TextStyle(fontSize: 25)),
                SizedBox(height: 5),
                Text(
                  widget.numberText,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 49),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          backgroundColor: Color(0x7465b9ac),
                        ),
                        onPressed: () {},
                        child: Row(
                          spacing: 10,
                          children: [
                            Icon(Icons.call, color: Colors.white),
                            Text(
                              'Audio',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 49),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          backgroundColor: Color(0x7465b9ac),
                        ),
                        onPressed: () {},
                        child: Row(
                          spacing: 10,
                          children: [
                            Icon(
                              CupertinoIcons.video_camera_solid,
                              color: Colors.white,
                            ),
                            Text(
                              'Video',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 170,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.notifications_none_sharp,
                    color: Colors.grey.shade600,
                    size: 22,
                  ),
                  title: Text('Notification'),
                  onTap: () {
                    HapticFeedback.selectionClick();
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.security,
                    color: Colors.grey.shade600,
                    size: 22,
                  ),
                  title: Text('Advance security'),
                  onTap: () {
                    HapticFeedback.selectionClick();
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.image,
                    color: Colors.grey.shade600,
                    size: 22,
                  ),
                  title: Text('Saved images'),
                  onTap: () {
                    HapticFeedback.selectionClick();
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.favorite_border,
                    color: Colors.grey.shade600,
                    size: 22,
                  ),
                  title: Text('Add to favorite'),
                  onTap: () {
                    HapticFeedback.selectionClick();
                  },
                ),
                ListTile(
                  leading: Icon(CupertinoIcons.delete, color: Colors.red),
                  title: Text(
                    'Delete contact',
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () {
                    HapticFeedback.selectionClick();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
