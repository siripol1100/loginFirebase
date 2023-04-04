import 'package:flutter/material.dart';
import 'package:loginfirebase/src/constants/text_string.dart';

class DashboardSearchBox extends StatelessWidget {
  const DashboardSearchBox({
    Key? key,
    required this.texttheme,
  }) : super(key: key);

  final TextTheme texttheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(left: BorderSide(width: 4))),
      padding:
          const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(tDashboardSearch,
              style: texttheme.headline2
                  ?.apply(color: Colors.grey.withOpacity(0.5))),
          const Icon(
            Icons.mic,
            size: 25,
          ),
        ],
      ),
    );
  }
}