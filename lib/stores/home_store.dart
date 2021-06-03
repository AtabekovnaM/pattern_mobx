import 'package:mobx/mobx.dart';
import 'package:pattern_mobx/model/post_model.dart';
import 'package:pattern_mobx/service/http_service.dart';



part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable bool isLoading = false;

  @observable List<Post> items = new List();

  Future apiPostList() async {
    isLoading = true;
    var response = await NetWork.GET(NetWork.API_LIST, NetWork.paramsEmpty());
    isLoading = false;
    if (response != null) {
      items = NetWork.parsePostList(response);
    } else {
      items = new List();
    }
  }

  Future<bool> apiPostDelete(Post post) async {
    isLoading = true;
    var response = await NetWork.DEL(NetWork.API_DELETE + post.id.toString(), NetWork.paramsEmpty());
    isLoading = false;
    return response != null;
  }

}