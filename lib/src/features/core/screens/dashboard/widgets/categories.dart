import 'package:flutter/material.dart';
import 'package:loginfirebase/src/constants/colors.dart';
import 'package:loginfirebase/src/features/core/models/dashboard/categories_model.dart';

class DashboardCategories extends StatelessWidget {
  const DashboardCategories({
    Key? key,
    required this.texttheme,
  }) : super(key: key);

  final TextTheme texttheme;

  @override
  Widget build(BuildContext context) {
    final list = DashboardCategoriesModel.list;
    return SizedBox(
      height: 45,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: list[index].onPress,
            child: SizedBox(
              height: 50,
              width: 170,
              child: Row(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: tDarkColor),
                    child: Center(
                      child: Text(
                        list[index].title,
                        style: texttheme.headline6?.apply(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  FittedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          list[index].heading,
                          style: texttheme.headline6,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          list[index].subHeading,
                          style: texttheme.bodyText2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
