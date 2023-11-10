import 'package:flutter/material.dart';

class MovieCategory extends StatelessWidget {
  const MovieCategory({super.key, required this.txt});
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
              image: AssetImage('assets/images/nefilex_logo.png'),
              fit: BoxFit.fill)),
      child: Text(
        txt,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 25,
            ),
        maxLines: 1,
        textAlign: TextAlign.center,
      ),
    );
  }
}
