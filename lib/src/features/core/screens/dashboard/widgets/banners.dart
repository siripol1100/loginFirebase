import 'package:flutter/material.dart';
import 'package:loginfirebase/src/constants/colors.dart';
import 'package:loginfirebase/src/constants/image_string.dart';
import 'package:loginfirebase/src/constants/sizes.dart';
import 'package:loginfirebase/src/constants/text_string.dart';

class DashboarBanners extends StatelessWidget {
  const DashboarBanners({
    Key? key,
    required this.texttheme,
  }) : super(key: key);

  final TextTheme texttheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                color: tCardBgColor),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Flexible(child: Image(image: AssetImage(tBookmarkICon))),
                    Flexible(
                        child: Image(
                      image: AssetImage(tBannerImage1),
                      height: 50,
                    )),
                  ],
                ),
                const SizedBox(height: 25),
                Text(
                  tDashboardBannerTitle1,
                  style: texttheme.headline4,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  tDashboardBannerSubTitle,
                  style: texttheme.bodyText2,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: tDashboardCardPading),
        Expanded(
            child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: tCardBgColor),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Flexible(child: Image(image: AssetImage(tBookmarkICon))),
                      Flexible(
                          child: Image(
                        image: AssetImage(tBannerImage1),
                        height: 50,
                      )),
                    ],
                  ),
                  Text(
                    tDashboardBannerTitle2,
                    style: texttheme.headline4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    tDashboardBannerSubTitle,
                    style: texttheme.bodyText2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () {}, child: Text(tDashboardButton)),
            )
          ],
        ))
      ],
    );
  }
}
