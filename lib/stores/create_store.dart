import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pattern_mobx/model/post_model.dart';
import 'package:pattern_mobx/service/http_service.dart';


//
// part 'home_store.g.dart';

// class CreateStore = _CreateStore with _$CreateStore;

abstract class CreateStore with Store {
  @observable var titleController = TextEditingController();
  @observable var bodyController = TextEditingController();
  @observable var isLoading = false;
  @observable List<Post> items = new List();

  Future apiPostCreate(BuildContext context) async{

    isLoading = true;
    String title = titleController.text.trim().toString();
    String body = bodyController.text.trim().toString();
    Post post = Post(title: title, body: body, userId: 1);

    var response = await NetWork.POST(NetWork.API_CREATE, NetWork.paramsCreate(post));
    isLoading = false;
    Navigator.pop(context,response);

  }

}