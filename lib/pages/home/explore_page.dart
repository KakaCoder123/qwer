import 'package:a1/models/class_users.dart';
import 'package:a1/models/feed_item.dart';
import 'package:a1/models/user_services.dart';
import 'package:a1/pages/home/svedenia_page.dart';
import 'package:a1/widgets/home_button.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  bool isDefault = true;
  final UserServices _userServices = UserServices();

  List<FeedItem> items = [];

  Future<void> loadData()async{
    final List<ClassUsers> users = await _userServices.loadUser();
    final List<FeedItem> loadedItems = [];

    for (final user in users){
      for(final post in user.discovers){
        loadedItems.add(
          FeedItem(
              users: user,
              post: post
          )
        );
        loadedItems.sort((a,b) => b.post.publishTime.compareTo(a.post.publishTime));
      }
    }
    setState(() {
      items = loadedItems;
    });
  }





  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }


  


  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              HomeButton(onPressed: (){
                setState(() {
                  isDefault = true;
                });
              }, text: "Default", colors: isDefault ? Colors.deepPurpleAccent : Colors.grey),
              HomeButton(onPressed: (){
                setState(() {
                  isDefault = false;
                });
              }, text: "Loose", colors: isDefault ? Colors.grey : Colors.deepPurpleAccent )
            ],
          ),

          Expanded(child: isDefault
              ? GridView.builder(
              itemCount: items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.75,
                  mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index){
                final users = items[index].users;
                final posts = items[index].post;
                final media = posts.media.first;

                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SvedeniaPage(item: items[index])));
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Image.asset("assets/media/${media.file}", width: double.infinity, height: size.height * 0.23, fit: BoxFit.cover,),
                        SizedBox(height: 10,),
                        Text(posts.title),
                        Row(
                          children: [
                            CircleAvatar(radius: 15, backgroundImage: AssetImage("assets/media/${users.avatar}"), ),
                            SizedBox(width: 10,),
                            Text(users.username),

                            Spacer(),
                            TextButton(onPressed: (){}, child: Text("follow"))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }
          )
              : ListView.builder(
              itemCount: items.length,
              itemBuilder:(context, index){
                final users = items[index].users;
                final posts = items[index].post;
                final media = posts.media.first;

                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SvedeniaPage(item: items[index])));
                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(radius: 15, backgroundImage: AssetImage("assets/media/${users.avatar}"), ),
                              SizedBox(width: 10,),
                              Text(users.username),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Image.asset("assets/media/${media.file}", width: double.infinity, height: size.height * 0.25, fit: BoxFit.cover,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(posts.title),
                              TextButton(onPressed: (){}, child: Text("follow"))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
          )
          )



          
          
        ],
      ),
    );
  }
}
