import 'package:go_router/go_router.dart';
import 'package:project/controllers/authController.dart';
import 'package:project/screens/bottom_bar/bottom_bar.dart';
import 'package:project/screens/food_order/food_order.dart';
import '../screens/food_details/food_details.dart';
import '../../screens/initial_page/initial_page.dart';
import '../../screens/to_be_implemented/to_be_implemented.dart';
import '../../screens/home/home.dart';
import '../router/constants.dart';

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  routes: [
    // Initial Page (Sign Up)
    GoRoute(
      path: initialPage,
      builder: (context, state) => const InitialPage(),
      redirect: (context, state) =>
          AuthController.isUserSignedIn() ? home : null,
    ),

    // Shell Route for Bottom Bar
    ShellRoute(
      navigatorKey: shellNavigatorKey,
      builder: (context, state, child) {
        return BottomBar(child: child);
      },
      routes: <GoRoute>[
        // HomePage
        GoRoute(
          path: home,
          builder: (context, state) => const Home(),
          routes: <GoRoute>[
            //Food Details
            GoRoute(
                path: foodDetails,
                parentNavigatorKey: navigatorKey,
                builder: (context, state) => const FoodDetails()),

            // Food Order
            GoRoute(
                path: foodOrder,
                builder: (context, state) => const FoodOrder()),

            // To_Be_Implemented
            GoRoute(
                path: toBeImplemented,
                parentNavigatorKey: navigatorKey,
                builder: (context, state) => const ToBeImplemented()),
          ],
        ),
      ],
    )
  ],
);
