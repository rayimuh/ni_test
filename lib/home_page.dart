import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_page.dart';
import 'api_service.dart';
import 'add_page.dart';
import 'edit_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    ApiService().fetchList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AuthPage())));
              },
              icon: Icon(Icons.logout))
        ],
        title: Text("List To-Do"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddPage()));
        },
      ),
      body: RefreshIndicator(
          onRefresh: ApiService().fetchList,
          child: ListView.builder(
              itemCount: items.length,
              itemBuilder: ((context, index) {
                final list = items[index] as Map;
                final id = list["_id"] as String;
                return ListTile(
                  title: Text(list["title"]),
                  subtitle: Text(list["description"]),
                  trailing: Wrap(
                    spacing: 12,
                    children: <Widget>[
                      IconButton(
                          onPressed: () {
                            ApiService().deleteList(id);
                          },
                          icon: Icon(Icons.delete)),
                      IconButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>EditPage(name: list["title"]as String,desc: list["description"]as String,id: id,)));
                          },
                          icon: Icon(Icons.edit)),
                    ],
                  ),
                );
              }))),
    );
  }
}
