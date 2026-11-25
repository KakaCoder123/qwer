import 'package:a1/models/current_user.dart';
import 'package:a1/pages/login_page.dart';
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    final user = CurrentUser.user;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.03,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(width: size.width * 0.2,),
                  Column(
                    children: [
                      CircleAvatar(backgroundImage: AssetImage("assets/media/${user.avatar}"), radius: 40,),
                      SizedBox(height: 10,),
                      Text(user.nickname, style: TextStyle(fontSize: 20),)
                    ],
                  ),
                  ElevatedButton(onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                  }, child: Text("Logout"))
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("0 \n Подписки", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  Text("0 \n Взаимные \nподписки", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),

                ],
              ),
              Text("Все публикации", style: TextStyle(fontSize: 20),),

              SizedBox(height: size.height * 0.43,
              child: GridView.builder(
                  itemCount: user.discovers.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.8,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index){
                    return Card(
                      child: Column(
                        children: [
                          Image.asset("assets/media/${user.discovers[index].media.first.file}", fit: BoxFit.cover, width: double.infinity, ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: Text(user.discovers[index].title, style: TextStyle(fontSize: 10), )),
                              IconButton(onPressed: (){}, icon: Icon(Icons.delete))
                            ],
                          )
                        ],
                      ),
                    );
                  }
              ),
              ),

              Divider(),
              Icon(Icons.delete, size: 30,)

            ],
          ),
        ),
      ),

    );
  }
}
