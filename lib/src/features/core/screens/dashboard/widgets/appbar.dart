import 'package:flutter/material.dart';
import 'package:loginfirebase/src/constants/colors.dart';
import 'package:loginfirebase/src/constants/image_string.dart';
import 'package:loginfirebase/src/constants/text_string.dart';
import 'package:loginfirebase/src/repository/authentication_repository.dart';

class BashboarAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BashboarAppBar({
    Key? key,
    required this.isDark,
  }) : super(key: key);

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    // var mediaQuery = MediaQuery.of(context);
    // var brightness = mediaQuery.platformBrightness;
    // final isDark = brightness == Brightness.dark;

    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      leading: Icon(
        Icons.menu,
        //For Dark Color
        color: isDark ? tWhiteColor : tDarkColor,
      ),
      title: Text(tAppName, style: Theme.of(context).textTheme.headline4),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20, top: 7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            //For Dark Color
            color: isDark ? tSecondaryColor : tCardBgColor,
          ),
          child: IconButton(
              onPressed: () {
                AuthenticationRepository.instance.logout();
              },
              icon: const Image(image: AssetImage(tUserProfileImage))),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(55);
}
