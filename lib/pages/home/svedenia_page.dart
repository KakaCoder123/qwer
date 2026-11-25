import 'package:a1/models/feed_item.dart';
import 'package:flutter/material.dart';

class SvedeniaPage extends StatelessWidget {
  final FeedItem item;
  const SvedeniaPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final post = item.post;
    final user = item.users;
    final media = post.media.first;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage("assets/media/${user.avatar}"),),
            SizedBox(width: 10,),
            Text(user.nickname)
          ],
        ),
      ),
      body: Column(
        children: [
          Image.asset("assets/media/${media.file}", width: double.infinity, height: size.height * 0.3, fit: BoxFit.cover,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Chip(label: Text("data"),), SizedBox(width: 10,),  Chip(label: Text("data"),),  SizedBox(width: 10,), Chip(label: Text("data"),), SizedBox(width: 10,),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(post.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    FilledButton(onPressed: (){}, child: Text("Floating window"))
                  ],
                ),
                Text(post.subtitle, style: TextStyle(fontSize: 18),),
                SizedBox(height: 10,),
                Text(post.description, style: TextStyle(fontSize: 12)),
                SizedBox(height: 10,),
                Text(post.publishTime, style: TextStyle(fontSize: 12)),
                Divider(),
                Text("comments",  style: TextStyle(fontSize: 12)),


              ],
            ),
          ),



        ],
      ),
    );
  }
}
