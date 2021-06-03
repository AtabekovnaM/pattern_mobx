import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pattern_mobx/model/post_model.dart';
import 'package:pattern_mobx/service/http_service.dart';


// part 'home_store.g.dart';

// class UpdateStore = _UpdateStore with _$UpdateStore;

abstract class UpdateStore with Store {
  var titleController = TextEditingController();
  var bodyController = TextEditingController();
  var isLoading = false;
  var post = Post();


  void apiPostUpdate(BuildContext context) async{
    isLoading = true;
    var response = await NetWork.PUT(NetWork.API_UPDATE + post.id.toString(),NetWork.paramsUpdate(post));
    Navigator.of(context).pop({'data': 'done'});
    isLoading = false;

  }

}