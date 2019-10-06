
import 'package:login_app/shared/models/create_user_dto.dart';
import 'package:login_app/shared/models/login_dto.dart';
import 'package:login_app/shared/models/user.dart';
import 'iuser_repository.dart';

class UserRepository implements IUserRepository {
  @override
  Future<User> findUser() async {
    try {
      return User();
    } catch(e){
      rethrow;
    }
  }

  @override
  Future<String> login(LoginDto loginDto) async{
    try {
      return "podipa";
    } catch(e){
      rethrow;
    }
  }

  @override
  Future<void> save(CreateUserDto createUserDto) async {//obviamente kkkkkksaff
    try {
    }
    catch (e){
      rethrow;
    }
  }
  
}