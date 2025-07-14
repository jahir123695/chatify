import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class AddContactLayout extends StatefulWidget {
  const AddContactLayout({super.key});

  @override
  State<AddContactLayout> createState() => _AddContactLayoutState();
}

class _AddContactLayoutState extends State<AddContactLayout> {
  // File? _galleryImage;
  String? selectedAgeGroup;
  List<String> dropDownItem = ['7-12', '13-17', '18-23', '23-30', '30+'];

  // void galleryImagePickerFun() async {
  //   final ImagePicker picker = ImagePicker();
  //   final XFile? img = await picker.pickImage(source: ImageSource.gallery);
  //   if (img == null) return;
  //   setState(() {
  //     _galleryImage = File(img.path);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff65b9ac),
        title: Text('Add Contact'),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                // Padding(
                //   padding: const EdgeInsets.only(top: 25.0),
                //   child: Stack(
                //     clipBehavior: Clip.none,
                //     children: [
                //       SizedBox(
                //         width: 140,
                //         height: 140,
                //         child: Container(
                //           width: 120,
                //           height: 120,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(110),
                //             color: Colors.grey,
                //           ),
                //           child: CircleAvatar(
                //             backgroundImage:
                //                 _galleryImage != null
                //                     ? Image.file(_galleryImage!)
                //                         as ImageProvider
                //                     : AssetImage('images/profile.png'),
                //           ),
                //         ),
                //       ),
                //       Positioned(
                //         top: 90,
                //         left: 90,
                //         child: InkWell(
                //           onTap: () {
                //             galleryImagePickerFun();
                //           },
                //           child: Container(
                //             width: 50,
                //             height: 50,
                //             decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(50),
                //               color: Colors.white,
                //               border: Border.all(
                //                 color: Colors.grey,
                //                 width: 1,
                //               ),
                //             ),
                //             child: Center(
                //               child: Icon(
                //                 Icons.add_a_photo_rounded,
                //                 color: Color(0xff65b9ac),
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 25,
                    left: 15,
                    right: 15,
                    bottom: 20,
                  ),
                  child: TextFormField(
                    cursorColor: Color(0xff65b9ac),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      icon: Icon(Icons.person, color: Colors.grey, size: 24),
                      labelText: 'First name',
                      labelStyle: TextStyle(color: Colors.grey.shade600),
                      floatingLabelStyle: TextStyle(
                        color: Colors.grey.shade800,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff65b9ac),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: TextFormField(
                    cursorColor: Color(0xff65b9ac),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      icon: Icon(Icons.person, color: Colors.white, size: 24),
                      labelText: 'Last name',
                      labelStyle: TextStyle(color: Colors.grey.shade600),
                      floatingLabelStyle: TextStyle(
                        color: Colors.grey.shade800,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff65b9ac),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 55,
                          top: 10,
                          right: 10,
                        ),
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Select Age',
                            labelStyle: TextStyle(color: Colors.grey.shade600),
                            floatingLabelStyle: TextStyle(
                              color: Colors.grey.shade800,
                            ),
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          value: selectedAgeGroup,
                          isExpanded: true,
                          items:
                              dropDownItem.map((String item) {
                                return DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedAgeGroup = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15, top: 25),
                        child: TextFormField(
                          cursorColor: Color(0xff65b9ac),
                          maxLength: 10,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'Phone no',
                            labelStyle: TextStyle(color: Colors.grey.shade600),
                            floatingLabelStyle: TextStyle(
                              color: Colors.grey.shade800,
                            ),
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.grey,
                              size: 20,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff65b9ac),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15,top: 25),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                backgroundColor: Color(0xff65b9ac),
              ),
                onPressed: () {
                Fluttertoast.showToast(msg: 'Saved');
            }, child: Row(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.save_as_sharp,color: Colors.white,),
                Text('Save',style: TextStyle(color: Colors.white,fontSize: 16),)
              ],
            )),
          )
        ],
      ),
    );
  }
}
