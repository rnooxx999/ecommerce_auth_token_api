
import 'package:shop_route/api/api_manager.dart';
import 'package:shop_route/repository/auth/auth_repo_contract.dart';
import 'package:shop_route/repository/auth/impl/auth_remot_data_source.dart';
import 'package:shop_route/repository/auth/impl/auth_repo_impl.dart';



//Injectible :
//Tree Pattern When We Need Use Classes Inside Other Class
//عندما نحتاج كلاس بدلا من تعريف جميع الكلاسات واحد تلوى الاخرى نقوم بارساله الى الكونستركتور

AuthRepository getAuthRepositry(AuthRemoteDataSource remoteDataSource){
  return AuthRepositoryImpl(remoteDataSource);
}

AuthRemoteDataSource getAuthRemote(ApiManager apiManager){
  return AuthRemoteDataSourcesImpl(apiManager);
}

ApiManager getApiManager(){
  return ApiManager();
}

//الحقن الذي يجمع الكلاسات السابقة
AuthRepository injectAuthRepositry(){
  return getAuthRepositry(getAuthRemote(getApiManager()));
}