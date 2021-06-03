import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pattern_mobx/stores/update_store.dart';



class UpdatePage extends StatefulWidget {
  static final String id = 'update_page';

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {

  UpdateStore store = new UpdateStore();

  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic> map = ModalRoute.of(context).settings.arguments as Map;

    store.post.id = map["id"];
    store.post.title = map["title"];
    store.post.body = map["body"];
    store.post.userId = map["userId"];

    store.titleController.text = store.post.title;
    store.bodyController.text = store.post.body;

    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(left: 90),
          child: Text("Update Post"),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: store.titleController,
              decoration: InputDecoration(
                hintText: store.post.title,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: store.bodyController,
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: store.post.body,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              height: 45,
              child: FlatButton(
                onPressed: (){
                  String title = store.titleController.text;
                  String body = store.bodyController.text;
                  store.post.title = title;
                  store.post.body = body;
                  store.apiPostUpdate(context);
                },
                color: Colors.blue,
                child: Text(
                  "Update",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
