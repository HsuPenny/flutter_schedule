import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../my_color.dart';
import '../my_text_style.dart';

class SeeMoreButton extends StatelessWidget{
  final Function() onPressed;
  const SeeMoreButton(this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '查看更多',
            style: MyTextStyle.darkAqua(14, fontWeight: FontWeight.w500),
          ),
          SvgPicture.asset(
            width: 14,
            color: MyColor.darkAqua,
            'assets/svgs/double_arrow.svg',
          )
        ],
      ),
    );
  }
}