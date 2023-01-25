import 'package:flutter/material.dart';
import 'api_service.dart';

class EditPage extends StatefulWidget {
  final String id;
  final String name;
  final String desc;
  const EditPage({Key? key,required this.name,required this.desc, required this.id}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();
  @override 
  void initState(){
    super.initState();
    title.text=widget.name;
    desc.text=widget.desc;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Edit To-Do"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: title,
                      decoration: InputDecoration(
                          labelText: "Masukkan Title",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: desc,
                      decoration: InputDecoration(
                          labelText: "Masukkan Deskripsi",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        ApiService().editList(title.text, desc.text, widget.id).then((value) => Navigator.pop(context));
                      },
                      child: Center(
                        child: Text("SUBMIT"),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
