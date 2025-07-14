import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroImageLayout extends StatefulWidget {
  final String heroTag;
  final String imageUrl;

  const HeroImageLayout({super.key, required this.imageUrl,required this.heroTag});

  @override
  State<HeroImageLayout> createState() => _HeroImageLayoutState();
}

class _HeroImageLayoutState extends State<HeroImageLayout> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Hero(
            tag: widget.heroTag,
            child: Image.network(widget.imageUrl, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
