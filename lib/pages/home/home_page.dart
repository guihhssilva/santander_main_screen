import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:santander_main_screen/models/user_model/user_model.dart';
import 'package:santander_main_screen/services/api.dart';
import 'package:santander_main_screen/shared/app_colors.dart';
import 'package:santander_main_screen/shared/app_images.dart';
import 'package:santander_main_screen/shared/app_settings.dart';
import 'package:santander_main_screen/widgets/balance.dart';
import 'package:santander_main_screen/widgets/card.dart';
import 'package:santander_main_screen/widgets/features.dart';
import 'package:santander_main_screen/widgets/header.dart';
import 'package:santander_main_screen/widgets/info_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserModel? user;
  @override
  void initState() {
    super.initState();
    fetch();
  }

  fetch() async {
    user = await ApiApp.fetchUser(1);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    AppSettings.screenWidth = MediaQuery.of(context).size.width;
    AppSettings.screenHeight = MediaQuery.of(context).size.height;

    return user == null
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            drawer: const Drawer(),
            appBar: AppBar(
              backgroundColor: AppColors.red,
              foregroundColor: Colors.white,
              title:
                  Center(child: SvgPicture.asset(AppImages.logo, height: 24)),
              actions: [
                Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: SvgPicture.asset(AppImages.notification, height: 24))
              ],
            ),
            body: Stack(
              children: [
                Column(
                  children: [
                    HeaderWidget(user: user!),
                    const SizedBox(height: 140),
                    FeaturesWidget(features: user!.features!),
                    const SizedBox(height: 10),
                    CardWidget(card: user!.card!),
                    const SizedBox(height: 10),
                    InfoCardsWidget(news: user!.news!),
                  ],
                ),
                Positioned(
                    top: AppSettings.screenHeight / 5 - 65,
                    child: BalanceWidget(account: user!.account!))
              ],
            ),
          );
  }
}
