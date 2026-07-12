import 'package:mens_store/features/account/screens/account_screen_body.dart';
import 'package:mens_store/features/account/screens/address_screen_body.dart';
import 'package:mens_store/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:mens_store/features/cart/presentation/views/cart_screen.dart';
import 'package:mens_store/features/home/widgets/home_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  var pages = [
    const HomeScreenBody(),
    const CartScreen(),
    const AccountScreenBody(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          if (currentIndex == 1) {
            context.read<CartCubit>().getUserCart();
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
      body: SafeArea(child: pages[currentIndex]),
    );
  }
}
