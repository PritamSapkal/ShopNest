import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppearanceWidget extends StatelessWidget {
  const AppearanceWidget({
    super.key,
    required this.icon,
    required this.settingName,
    required this.isSelected,
    required this.onTap,
  });

  final Icon icon;
  final String settingName;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: icon,
            ),

            Text(
              settingName,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 13.sp),
            ),

            const Spacer(),

            Checkbox(
              shape: const CircleBorder(),
              value: isSelected,
              onChanged: (_) => onTap(),
              focusColor: Colors.green,
              activeColor: Colors.green,
              checkColor: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}