import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../app/utils/constants/colors.dart';

class MyNavigationMenu extends StatelessWidget {
  const MyNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 0,
        backgroundColor: MyColors.primary,
        foregroundColor: MyColors.softGrey,
        shape: const CircleBorder(),

        child: Icon(Iconsax.scan),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        height: 64,
        color: MyColors.primary,
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              onPressed: () {
                // Handle home button press
                Navigator.of(context).pushNamed('/home');
              },
              icon: Icon(Iconsax.shop),
              color: MyColors.softGrey,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Iconsax.shopping_cart),
              color: MyColors.softGrey,
            ),
            const SizedBox(width: 48), // Space for the FAB
            IconButton(
              onPressed: () {},
              icon: Icon(Iconsax.menu_board),
              color: MyColors.softGrey,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Iconsax.user),
              color: MyColors.softGrey,
            ),
          ],
        ),
      ),
    );
  }
}
