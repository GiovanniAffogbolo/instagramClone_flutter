import 'package:flutter/material.dart';
import 'package:insta_clone/src/utils/ui_image_data.dart';
import 'package:insta_clone/src/widgets/post.dart';
import 'package:insta_clone/src/widgets/story.dart';

class InstaHomeBody extends StatefulWidget {
  @override
  _InstaHomeBodyState createState() => _InstaHomeBodyState();
}

class _InstaHomeBodyState extends State<InstaHomeBody> {
  // Build function
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: ListView.builder(
        itemCount: UIImageData.storiesList.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Story(); // story.dart from widgets package
          } else {
            return Post(index); // post.dart from widgets package
          }
        },
      ),
      onRefresh: () async {},
    );
  }
}