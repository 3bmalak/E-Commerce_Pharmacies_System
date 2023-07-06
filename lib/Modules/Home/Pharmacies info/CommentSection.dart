import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';

class TestMe extends StatefulWidget {

  @override
  _TestMeState createState() => _TestMeState();
}

class _TestMeState extends State<TestMe> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List filedata = [
    {
      'name': 'Youssef Abdelmlak',
      'pic': 'assets/joe.jpg',
      'message': 'its very efficient ',
      'date': '2023-01-01 12:00:00',
    
    },
    {
      'name': 'Amira Eslam',
      'pic': 'https://www.adeleyeayodeji.com/img/IMG_20200522_121756_834_2.jpg',
      'message': 'Very professional',
      'date': '2023-02-25 2:00:00'
    },
    {
      'name': 'Mohamed Gamal',
      'pic': 'assets/gimmy.jpg',
      'message': 'bad response time',
      'date': '2023-2-11 23:00:00'
    },
    {
      'name': 'Madonna 3mad',
      'pic': 'https://picsum.photos/300/30',
      'message': 'I didnt have the best experience',
      'date': '2021-01-01 4:00:00'
    },
    {
      'name': 'Mohamed 3mad',
      'pic': 'assets/palu.jpg',
      'message': 'Great Staff',
      'date': '2023-2-02 10:00:00'
    },

  ];

  Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: CommentBox.commentImageParser(
                          imageURLorPath: data[i]['pic'])),
                ),
              ),
              title: Text(
                data[i]['name'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i]['message']),
              trailing: Text(data[i]['date'], style: const TextStyle(fontSize: 10)),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comment Page"),
        backgroundColor: const Color(0xFF145DA0),
      ),
      body: Container(
        child: CommentBox(
          userImage: CommentBox.commentImageParser(
              imageURLorPath: "assets/profile.jpg"),
          labelText: 'Write a comment...',
          errorText: 'Comment cannot be blank',
          withBorder: false,
          sendButtonMethod: () {
            if (formKey.currentState!.validate()) {
              print(commentController.text);
              setState(() {
                var value = {
                  'name': 'Mohamed 3ssam',
                  'pic':
                  'assets/profile.jpg',
                  'message': commentController.text,
                  'date': '2021-03-04 00:43:12'
                };
                filedata.insert(0, value);
              });
              commentController.clear();
              FocusScope.of(context).unfocus();
            } else {
              print("Not validated");
            }
          },
          formKey: formKey,
          commentController: commentController,
          backgroundColor: const Color(0xFF145DA0),
          textColor: Colors.white,
          sendWidget: const Icon(Icons.send_sharp, size: 30, color: Colors.white),
          child: commentChild(filedata),
        ),
      ),
    );
  }
}