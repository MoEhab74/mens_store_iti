import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mens_store/core/utils/service_locator.dart';
import 'package:mens_store/features/auth/cubit/auth_cubit.dart';
import 'package:mens_store/features/auth/login/presentation/views/login_screen.dart';
import 'package:mens_store/features/auth/sign_up/presentation/views/sign_up_screen.dart';
import 'package:mens_store/features/home/cubits/categories/cubit.dart';
import 'package:mens_store/features/home/cubits/products/cubit.dart';
import 'package:mens_store/features/home/screens/home_screen.dart';
import 'package:mens_store/features/splash/splash_screen.dart';
import 'app_routes.dart';

class RouteGenerator {
  static GoRouter mainRoutingInOurApp = GoRouter(
    initialLocation: AppRoutes.splashScreen,
    // List of Routes
    routes: [
      GoRoute(
        path: AppRoutes.loginScreen,
        name: AppRoutes.loginScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => locator<AuthCubit>(),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.homeScreen,
        name: AppRoutes.homeScreen,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider<AuthCubit>(create: (context) => locator<AuthCubit>()),
            BlocProvider<ProductSCubit>(
              create: (context) => locator<ProductSCubit>(),
            ),
            BlocProvider<CategoriesCubit>(
              create: (context) => locator<CategoriesCubit>(),
            ),
          ],
          child: const HomeScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.signUpScreen,
        name: AppRoutes.signUpScreen,
        builder: (context, state) => const SignUpScreen(),
      ),
      // GoRoute(
      //   path: AppRoutes.addressScreenBody,
      //   name: AppRoutes.addressScreenBody,
      //   builder: (context, state) => BlocProvider(
      //     create: (context) => locator<AuthCubit>(),
      //     child: const AddressScreenBody(),
      //   ),
      // ),
      GoRoute(
        path: AppRoutes.splashScreen,
        name: AppRoutes.splashScreen,
        builder: (context, state) => const SplachScreen(),
      ),
    ],
  );
}
