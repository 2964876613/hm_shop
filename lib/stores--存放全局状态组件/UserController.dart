import 'package:get/state_manager.dart';
import 'package:hm_shop/viewmodels--%E5%AD%98%E6%94%BE%E7%B1%BB%E5%9E%8B%E6%96%87%E4%BB%B6/user.dart';
//需要共享的对象 要有一些共享的属性 属性需要响应式更新
class UserController extends GetxController{
  var user = UserInfo.fromJSON({}).obs; //user对象被监听了
  //想要取值的话 需要user.value
  updateUserInfo(UserInfo newUser)
  {
    user.value=newUser;
  }
}