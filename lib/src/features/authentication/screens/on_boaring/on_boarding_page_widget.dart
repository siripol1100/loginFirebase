import 'package:flutter/material.dart';
import 'package:loginfirebase/src/constants/sizes.dart';
import 'package:loginfirebase/src/features/authentication/models/model_on_boaring.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({super.key, required this.model});

  final OnboaringModel model;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(tDefaultSize),
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image(
            image: AssetImage(model.image),
            height: size.height * 0.4,
          ),
          Column(
            children: [
              Text(
                model.title,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                model.subtitle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Text(
            model.conunterText,
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            height: 80,
          )
        ],
      ),
    );
  }
}
