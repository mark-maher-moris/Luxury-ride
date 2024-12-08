import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  CustomBox(
      {super.key,
      this.borderRadius = 10,
      this.child,
      this.color = const Color(0xffF9F9F9),
      this.height,
      this.isCircle = false,
      this.onTap,
      this.padding,
      this.width,
      this.borderColor});
  dynamic? onTap;
  Widget? child;
  double? height;
  double? width;
  double? padding;
  bool isCircle;
  Color color;
  double borderRadius;
  Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      onTap: onTap == null ? () {} : onTap,
      child: Padding(
        padding: EdgeInsets.all(padding ?? 0),
        child: Container(
          child: Center(
            child: child,
          ),
          height: height ?? null,
          width: width ?? null,
          decoration: BoxDecoration(
              shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
              color: color,
              border: borderColor != null
                  ? Border.all(color: borderColor!, width: 2)
                  : null,
              boxShadow: [
                BoxShadow(
                    blurRadius: 5,
                    offset: Offset(0, 5),
                    spreadRadius: 1,
                    color: Colors.black12)
              ],
              borderRadius: isCircle
                  ? null
                  : BorderRadius.all(Radius.circular(borderRadius))),
        ),
      ),
    );
  }
}
