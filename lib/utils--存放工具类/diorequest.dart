//基于Dio进行二次封装
import 'package:dio/dio.dart';
import 'package:hm_shop/constants--%E5%AD%98%E6%94%BE%E5%B8%B8%E9%87%8F%E6%96%87%E4%BB%B6/index.dart';
import 'package:hm_shop/stores--%E5%AD%98%E6%94%BE%E5%85%A8%E5%B1%80%E7%8A%B6%E6%80%81%E7%BB%84%E4%BB%B6/TokenManager.dart';

class DioRequest {
  final _dio=Dio(); //dio请求对象
  //基础地址拦截器
  DioRequest(){
    _dio.options..baseUrl=GlobalConstens.BASE_URL
      ..connectTimeout=Duration(seconds: GlobalConstens.TIME_OUT)
      ..sendTimeout=Duration(seconds: GlobalConstens.TIME_OUT)
      ..receiveTimeout=Duration(seconds: GlobalConstens.TIME_OUT);
      _appInterceptor();
  }
  //拦截器
  void _appInterceptor(){
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (request, handler) {
        //注入token request header Authorization="Bearer token"
        if(tokenManager.getToken().isNotEmpty)
        {
          request.headers={
          "Authorization":"Bearer ${tokenManager.getToken()}"
        };
        }
        handler.next(request);
      },
      onResponse: (response, handler) {
        //http状态码 200 300
        if(response.statusCode!>=200&&response.statusCode!<300){
          handler.next(response);
          return;
        }
        handler.reject(DioException(requestOptions: response.requestOptions));
      },
      onError: (error, handler) {
        // handler.reject(error);
        handler.reject(
          DioException(
            requestOptions: error.requestOptions,
            message: error.response?.data["msg"]??""));
      },
    ));
  }

  Future<dynamic> get(String url,{Map<String,dynamic>? params}){
    return  _handleResponse(_dio.get(url,queryParameters: params) );
  }
  //定义post接口
  Future<dynamic> post(String url,{Map<String,dynamic>?data}){
    return _handleResponse(_dio.post(url,data: data));
  }
  //进一步处理返回结果的函数
  Future<dynamic> _handleResponse(Future<Response<dynamic>> task) async{
    try {
       Response<dynamic> res = await task;
    final data=res.data as Map<String,dynamic>;
    if(data["code"]==GlobalConstens.SUCCESS_CODE){
      //才认定 http状态和业务状态均正常 就可以正常的放行通过
      return data["result"];//只要result结果
    }
    //抛出异常
    // throw Exception(data["msg"]??"加载数据异常");
    throw DioException(
      requestOptions: res.requestOptions,
      message: data["msg"]??"加载数据失败");
    } catch (e) {
      // throw Exception(e); 
      rethrow; //不改变原来抛出的异常类型
    }
  }
}
//单例对象
final dioRequest=DioRequest();

//dio请求工具发出请求 返回的数据 Response<dynamic>.data
//把所有的接口data解放出来 拿到真正的数据 判断业务状态码是不是等于1