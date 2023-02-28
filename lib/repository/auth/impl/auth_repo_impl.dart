
import 'package:shop_route/repository/auth/auth_repo_contract.dart';

class AuthRepositoryImpl implements AuthRepository{

  AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<String?> login(String email, String password)async {
    var response =  await remoteDataSource.login(email, password);
    print(response);
    return response.token;
  }

  @override
  Future<String?> register(String name, String email, String password,
      String rePassword, String phone) async{
    var response =await remoteDataSource.register(name, email, password, rePassword, phone);
    print(response);

    return response.token;
  }


}