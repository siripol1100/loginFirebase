import 'package:flutter/material.dart';
import 'package:loginfirebase/src/constants/sizes.dart';
import 'package:loginfirebase/src/constants/text_string.dart';
import 'package:loginfirebase/src/features/core/screens/dashboard/widgets/appbar.dart';
import 'package:loginfirebase/src/features/core/screens/dashboard/widgets/banners.dart';
import 'package:loginfirebase/src/features/core/screens/dashboard/widgets/categories.dart';
import 'package:loginfirebase/src/features/core/screens/dashboard/widgets/search.dart';
import 'package:loginfirebase/src/features/core/screens/dashboard/widgets/top_courses.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final texttheme = Theme.of(context).textTheme;
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: BashboarAppBar(isDark: isDark),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDashboardPading),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Heading
              Text(
                tDashboardTitle,
                style: texttheme.bodyText2,
              ),
              Text(
                tDashboardHeading,
                style: texttheme.headline2,
              ),
              const SizedBox(height: tDashboardPading),

              //Search Box
              DashboardSearchBox(texttheme: texttheme),
              const SizedBox(height: tDashboardPading),

              //Catagories
              DashboardCategories(texttheme: texttheme),
              const SizedBox(height: tDashboardPading),

              //Banners
              DashboarBanners(texttheme: texttheme),
              const SizedBox(height: tDashboardPading),

              //Top Coures
              Text(
                tDashboardTopCourses,
                style: texttheme.headline4?.apply(fontSizeFactor: 1.2),
              ),
              DashboardTopCorese(texttheme: texttheme)
            ],
          ),
        ),
      ),
    );
  }
}
