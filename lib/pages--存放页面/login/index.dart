import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hm_shop/api--%E5%AD%98%E6%94%BE%E8%AF%B7%E6%B1%82/user.dart';
import 'package:hm_shop/stores--%E5%AD%98%E6%94%BE%E5%85%A8%E5%B1%80%E7%8A%B6%E6%80%81%E7%BB%84%E4%BB%B6/TokenManager.dart';
import 'package:hm_shop/stores--%E5%AD%98%E6%94%BE%E5%85%A8%E5%B1%80%E7%8A%B6%E6%80%81%E7%BB%84%E4%BB%B6/UserController.dart';
import 'package:hm_shop/utils--%E5%AD%98%E6%94%BE%E5%B7%A5%E5%85%B7%E7%B1%BB/toastUtls.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _phoneController = TextEditingController(); // 账号控制器
  TextEditingController _codeController = TextEditingController(); // 密码控制器
  final UserController _userController = Get.find();
  // 用户账号Widget
  Widget _buildPhoneTextField() {
    return TextFormField(
      validator: (value) {
        if(value==null||value.isEmpty)
        {
          return "手机号不能为空";
        }
        //校验手机号
        if(!RegExp(r"^1[3-9]\d{9}$").hasMatch(value))
        {
          return "手机号格式不正确";
        };
        return null;
      },
      controller: _phoneController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 20), // 内容内边距
        hintText: "请输入账号",
        fillColor: const Color.fromRGBO(243, 243, 243, 1),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }

  // 用户密码Widget
  Widget _buildCodeTextField() {
    return TextFormField(
       validator: (value) {
        if(value==null||value.isEmpty)
        {
          return "密码不能为空";
        }
        //密码校验 6-16位数字，字母或下划线
         if(!RegExp(r"^[a-zA-Z0-9_]{6,16}$").hasMatch(value))
        {
          return "请输入6-16位的数字,字母或下划线";
        };
        return null;
      },
      controller: _codeController,
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 20), // 内容内边距
        hintText: "请输入密码",
        fillColor: const Color.fromRGBO(243, 243, 243, 1),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
 //登录方法
 _login () async {
  try {
    final res= await loginAPI({
    "account":_phoneController.text,
    "password":_codeController.text,
  });
  // print(res);//用户信息
  _userController.updateUserInfo(res);
  tokenManager.setToken(res.token); //写入持久化数据
  ToastUtls.showToast(context, "登录成功");
  Navigator.pop(context);//返回上个页面
  } catch (e) {
    ToastUtls.showToast(context, (e as DioException).message);
  }
  //调用登录接口
  
  //此时一定登录成功
  //http状态码 业务状态码
 }
  // 登录按钮Widget
  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          // 登录逻辑
          if(_key.currentState!.validate())
          {
            //进行勾选框的判断
            if(_isChecked){
              //校验通过
              _login();
            }
            else{
              //提示请勾选用户协议
              ToastUtls.showToast(context, "请勾选用户协议");
            }
          };
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text("登录", style: TextStyle(fontSize: 18, color: Colors.white)),
      ),
    );
  }

  bool _isChecked = false;
  // 勾选Widget
  Widget _buildCheckbox() {
    return Row(
      children: [
        // 设置勾选为圆角
        Checkbox(
          value: _isChecked,
          activeColor: Colors.black,
          checkColor: Colors.white,
          onChanged: (bool? value) {
            _isChecked=value??false;
            setState(() {});
          },
          // 设置形状
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // 圆角大小
          ),
          // 可选：设置边框
          side: BorderSide(color: Colors.grey, width: 2.0),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: "查看并同意"),
              TextSpan(
                text: "《隐私条款》",
                style: TextStyle(color: Colors.blue),
              ),
              TextSpan(text: "和"),
              TextSpan(
                text: "《用户协议》",
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 头部Widget
  Widget _buildHeader() {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            "账号密码登录",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
final GlobalKey<FormState> _key=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("惠多美登录", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
      ),
      body: Form(
        key: _key,
        child: Container(
          padding: EdgeInsets.all(30),
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: 20),
              _buildHeader(),
              SizedBox(height: 30),
              _buildPhoneTextField(),
              SizedBox(height: 20),
              _buildCodeTextField(),
              SizedBox(height: 20),
              _buildCheckbox(),
              SizedBox(height: 20),
              _buildLoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}
