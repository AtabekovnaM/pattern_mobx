import 'package:flutter/material.dart';
import 'package:pattern_mobx/model/post_model.dart';
import 'package:pattern_mobx/service/http_service.dart';
import 'package:pattern_mobx/stores/create_store.dart';





class CreatePage extends StatefulWidget {
  static final String id = "create_page";
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  CreateStore store = new CreateStore();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(left: 90),
          child: Text("Add Post"),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
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
                      hintText: "Title",
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: store.bodyController,
                    decoration: InputDecoration(
                      hintText: "Body",
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
                       store.apiPostCreate(context);
                      },
                      color: Colors.blue,
                      child: Text(
                        "Add",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          store.isLoading? Center(
            child: CircularProgressIndicator(),
          ): SizedBox.shrink(),
        ],
      ),
    );
  }

}
