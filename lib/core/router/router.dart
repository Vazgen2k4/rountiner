import 'package:auto_route/auto_route.dart';
import 'package:rountiner/features/main/presentation/main_page.dart';
import 'package:rountiner/features/start/presentation/start_page.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: StartRoute.page, path: '/', initial: true),
        AutoRoute(
          page: MainRoute.page,
          path: '/main',
        ),
        // AutoRoute(page: ProfileScreen),
        // AutoRoute(page: SettingsScreen),
        // AutoRoute(page: PostDetailsScreen),
        // AutoRoute(page: NotFoundScreen),
      ];
}
