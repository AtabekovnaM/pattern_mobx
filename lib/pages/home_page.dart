import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mobx/mobx.dart';
import 'package:pattern_mobx/model/post_model.dart';
import 'package:pattern_mobx/pages/create_page.dart';
import 'package:pattern_mobx/pages/update_page.dart';
import 'package:pattern_mobx/stores/home_store.dart';



class HomePage extends StatefulWidget {
  static final String id = 'home_page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 HomeStore store = new HomeStore();


  void _apiPostUpdate(Post post) async {
   var result  = await Navigator.pushNamed(context, UpdatePage.id, arguments: {"id": post.id, "title": post.title, "body": post.body, "userId": post.userId});
   if(result != null) {
     var done = (result as Map)["data"];
     if (done == "done") {
       setState(() {
         store.apiPostList();
       });
     }
   }
  }

  @override
  void initState() {
    super.initState();
    store.apiPostList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("setState"),
        ),
      ),
      body: Observer(
        builder: (_) => Stack(
          children: [
            ListView.builder(
                itemCount: store.items.length ,
                itemBuilder: (ctx, index){
                  return itemOfPost(store.items[index]);
                }
            ),
            store.isLoading
                ? Center(
              child: CircularProgressIndicator(),
            )
                : SizedBox.shrink(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: (){
          setState(() {
            Navigator.pushNamed(context, CreatePage.id);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget itemOfPost(Post post){
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title.toUpperCase(),
              style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(post.body),
          ],
        ),
      ),
      actions: <Widget>[
        IconSlideAction(
          caption: "Update",
          color: Colors.indigo,
          icon: Icons.edit,
          onTap: (){
            _apiPostUpdate(post);
          },
        ),
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: "Delete",
          color: Colors.red,
          icon: Icons.delete,
          onTap: (){
            store.apiPostDelete(post);
          },
        )
      ],
    );
  }
}
