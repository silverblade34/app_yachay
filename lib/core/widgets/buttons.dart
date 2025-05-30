import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String btnName;
  final VoidCallback click;
  const MyButton({
    super.key,
    required this.btnName,
    required this.click,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        click();
      },
      hoverColor: Colors.white,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xff635FF6),
          borderRadius: BorderRadius.all(Radius.circular(18)),
        ),
        child: Center(
          child: Text(
            btnName,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.white, fontSize: 10),
          ),
        ),
      ),
    );
  }
}
