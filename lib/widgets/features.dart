import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:santander_main_screen/models/user_model/feature.dart';
import 'package:santander_main_screen/shared/app_colors.dart';
import 'package:santander_main_screen/shared/app_settings.dart';

class FeaturesWidget extends StatefulWidget {
  final List<Feature> features;
  const FeaturesWidget({super.key, required this.features});

  @override
  State<FeaturesWidget> createState() => _FeaturesWidgetState();
}

class _FeaturesWidgetState extends State<FeaturesWidget> {
  Widget getFeature(String icon, String description) {
    return InkWell(
      onTap: () {
        //implementar a lógica de ir pra outras páginas
      },
      child: Card(
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          width: 140,
          height: 125,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.network(
                icon,
                semanticsLabel: description,
                colorFilter: ColorFilter.mode(AppColors.red, BlendMode.srcIn),
                width: 36,
                height: 36,
              ),
              const SizedBox(height: 16),
              Text(
                description,
                style: TextStyle(fontSize: 16, color: AppColors.grayLight),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 130,
      width: AppSettings.screenWidth,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: widget.features
            .map((e) => getFeature(e.icon!, e.description!))
            .toList(),
      ),
    );
  }
}
