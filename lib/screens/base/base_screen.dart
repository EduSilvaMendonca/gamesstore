import 'package:flutter/material.dart';
import 'package:lojavirtual2/common/custom_drawer/custom_drawer.dart';
import 'package:lojavirtual2/models/page_manager.dart';
import 'package:lojavirtual2/models/user_manager.dart';
import 'package:lojavirtual2/screens/admin_users/admin_users_screen.dart';
import 'package:lojavirtual2/screens/home/home_screen.dart';
import 'package:lojavirtual2/screens/products/products_screen.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) => PageManager(pageController),
        child: Consumer<UserManager>(
          builder: (_, userManager, __) {
            return PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                HomeScreen(),
                ProductsScreen(),
                Scaffold(
                  drawer: CustomDrawer(),
                  appBar: AppBar(
                    title: const Text('Home3'),
                  ),
                ),
                Scaffold(
                  drawer: CustomDrawer(),
                  appBar: AppBar(
                    title: const Text('Home4'),
                  ),
                ),
                if (userManager.adminEnabled)
                  ...[
                  AdminUsersScreen(),
                  Scaffold(
                    drawer: CustomDrawer(),
                    appBar: AppBar(
                      title: const Text('Pedidos'),
                    ),
                  ),
                ]
              ],
            );
          },
        ),
    );
  }
}
