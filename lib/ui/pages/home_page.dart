import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/banner.dart';
import '../widgets/product_card.dart';
import 'product_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView.count(
        childAspectRatio: 0.823,
        crossAxisCount: 2,
        children: const [
          ProductCard(
              imgSource:
                  "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTzIg2yuz7mcIMnQkxq-9qgBflfRkCwY4nCgvq1jDp8An_mMeXbUK2dFUqB2MJinfPGd9MaLc-a9gqbPzXmgdAxvwcJLwTYUYKpjgjwfT47KF1XFegZaVWr&usqp=CAE",
              productName: "Nike Dunk High",
              value: 120),
          ProductCard(
              imgSource:
                  "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQHTq62Ydvh2iB1toj4xCWNNLMTRtzA9MYI-8Kvfd2z1lwk2jZxh_-weuid1jCYORZ4uIqmR0TC4nbpGiQ6asgCiCVpvBcfyd5hzxoFsCc&usqp=CAE",
              productName: "Nike Court",
              value: 50),
          ProductCard(
              imgSource:
                  "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQW6aN-EDWyfR7PDOqMBHgkZ7Fc2lEuFMBsP49yIo7uJ37UGVibKlHkPIWsWDfy_pbdJo8EQ2SGu67N8izSpHPF4POViXM4f9gzDR-uIOsnmorEgtbtiRZPfA&usqp=CAE",
              productName: "Nike Team Hustle",
              value: 40),
          ProductCard(
              imgSource:
                  "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTATNqrQEQbuLRz07jif4uplLcDlurcxgjTsrQWAEQ4xTmIYuMUN6hT7eee8AKOOc0rs5LfTz0ybjd7UgRglg5JGL3crUd1-3ariQwfqbU&usqp=CAE",
              productName: "Nike Air Max Bold",
              value: 90),
          ProductCard(
              imgSource:
                  "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQBbTHpOjsVTyCY1x7N90IJNbmv7Xn-HGriaWfz8v-yyWZVobz9vY3lW4SMm-m1SmwOw9hUyK6DpyzaXzaGMu018tYICXZcEiM1mB43JaFtxqvTqBS3IzGWGw&usqp=CAE",
              productName: "Nike Dunk High",
              value: 150),
          ProductCard(
              imgSource:
                  "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcS5C1-TEiMlfoOxdYkKSKhE8dbJWmZ_uxReVQ5_GPhG3QPwdepTD4q1l2lhloX0sZ9c2tlJY7EtN7oqYnbz2GcGqlly2DuffCCWUWDfgrp0mXBBhWEKPrYqNA&usqp=CAE",
              productName: "Nike Court Vision",
              value: 75),
          ProductCard(
              imgSource:
                  "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSl4tc-mYzp4pRMVwugMfINbZY9EOoJcEUgqWw0WJBQ9gP4yXZ0iX-nFaVJQHRuj60iKz1VEF8dqQgvuj4yvkFuRhW539WeHohaKZ1oNO2Miy4gfAhg74i0OA&usqp=CAE",
              productName: "Nike Atlas Court",
              value: 80),
          ProductCard(
              imgSource:
                  "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcT2c2Z50935TqsSJq_Slot9LupDS0B0ZWCeA37fjlEIRnumFsV5VDL4MmEdYnm3yaogpLYoODx1HlU_N2k3HJxUNELDgj05puu0J5DHZOcm0gontuXaWlGaGA&usqp=CAE",
              productName: "Nike Blazer Mid",
              value: 90),
        ],
      ),
      //     child: Column(children: [
      //   Stack(
      //     children: [buildProfileImage()],
      //   ),
      //   const SizedBox(
      //     height: 60,
      //   ),
      //   const Text("Shopping Cart app",
      //       style: TextStyle(
      //           fontSize: 40,
      //           color: Colors.blueGrey,
      //           fontWeight: FontWeight.w400)),
      //   const SizedBox(
      //     height: 20,
      //   ),
      //   const Text(
      //     "Grupo 2",
      //     style: TextStyle(
      //         fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
      //   ),
      //   CartTotal(),
      // ])
    );
  }

  Widget buildProfileImage() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: const [
        CustomBanner(200),
        CircleAvatar(
          backgroundImage:
              NetworkImage("https://randomuser.me/api/portraits/men/93.jpg"),
          radius: 70.0,
        )
      ],
    );
  }

  Widget customAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => Get.to(() => ProductList(),
                transition: Transition.circularReveal,
                duration: const Duration(seconds: 1)),
            child: const Icon(
              Icons.shopping_cart_outlined,
              size: 50,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
