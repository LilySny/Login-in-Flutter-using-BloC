

import 'package:login_app/shared/models/create_user_dto.dart';
import 'package:login_app/shared/models/login_dto.dart';
import 'package:login_app/shared/models/user.dart';

abstract class IUserRepository {

  Future<String> login(LoginDto loginDto);

  Future<User> findUser();

  Future save(CreateUserDto createUserDto);
  
  }
  



