import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rountiner/core/router/router.dart';
import 'package:rountiner/features/auth/data/datasources/user/firestore_user_data_source.dart';
import 'package:rountiner/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:rountiner/features/auth/data/repositories/user_repository_impl.dart';
import 'package:rountiner/features/auth/data/strategies/auth/auth_strategy.dart';
import 'package:rountiner/features/auth/data/strategies/auth/facebook_auth_strategy.dart';
import 'package:rountiner/features/auth/domain/repositories/user_repository.dart';
import 'package:rountiner/features/auth/domain/usecases/login_with_facebook_usecase.dart';

@RoutePage()
class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StartPage'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // context.router.push(MainRoute());
            final userRepository = UserRepositoryImpl(
              FirestoreUserDataSource(),
            );
            final authRepository = AuthRepositoryImpl(
              userRepository: userRepository,
              strategy: FacebookAuthStrategy(),
            );

            await LoginWithFacebookUsecase(authRepository)();
          },
          child: Text('Auth with Facebook'),
        ),
      ),
    );
  }
}
