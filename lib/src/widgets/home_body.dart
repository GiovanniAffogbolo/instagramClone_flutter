import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_clone/src/customIcons/custom_icons.dart';
import 'package:insta_clone/src/utils/ui_image_data.dart';
import 'package:insta_clone/src/widgets/circle_image.dart';
import 'package:insta_clone/src/widgets/stories.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: ListView.builder(
        itemCount: UIImageData.storiesList.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Stories();
          } else {
            return post(index);
          }
        },
      ),
      onRefresh: () async {},
    );
  }

  // To display like count icon below comment icon
  int likeCount = 0;

  Widget post(int index) {
    return Column(
      children: <Widget>[
        // User profile, name and more option
        Row(
          children: <Widget>[
            CircleImage(
              UIImageData.child,
              imageSize: 36.0,
              whiteMargin: 2.0,
              imageMargin: 6.0,
            ),
            Text('_mark_official_'),
            Expanded(child: SizedBox()),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        // Single or collection of images
        Container(
          constraints: BoxConstraints(
            maxHeight: 200.0, // changed to 400
            minHeight: 200.0,
            maxWidth: double.infinity,
            minWidth: double.infinity,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
          child: Image.asset(UIImageData.storiesList[index]),
        ),
        SizedBox(height: 8.0), // For padding
        // Different icon buttons and image slider indicator
        Row(
          children: <Widget>[
            SizedBox(width: 12.0), // For padding
            Icon(CustomIcons.like_lineal),
            SizedBox(width: 16.0), // For padding
            Icon(CustomIcons.comment),
            SizedBox(width: 16.0), // For padding
            Transform.rotate(
              angle: 0.4,
              child: Icon(CustomIcons.paper_plane),
            ),
            Expanded(child: SizedBox()),
            Icon(CustomIcons.bookmark_lineal),
          ],
        ),
        SizedBox(height: 10.0), // For padding
        // People liked information with icon
        Row(
          children: <Widget>[
            SizedBox(width: 12.0), // For padding
            Stack(
              textDirection: TextDirection.rtl,
              children: <Widget>[
                // Spread elements
                ...UIImageData.storiesList.take(3).map((image) {
                  return Container(
                    height: 22.0,
                    width: 22.0,
                    margin: EdgeInsets.only(right: ++likeCount * 14.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width: 2.0,
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(image),
                      ),
                    ),
                  );
                }),
              ],
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Liked by ',
                      style: TextStyle(color: Colors.black54),
                    ),
                    TextSpan(
                      text: '_mark_official_ ',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'and ',
                      style: TextStyle(color: Colors.black54),
                    ),
                    TextSpan(
                      text: '67,324 others ',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        //Caption
        Text('data'),
        // View all comments
        Text('data'),
        // Add comment section
        Row(),
        // Uploaded time
        Text('data'),
      ],
    );
  }
}
