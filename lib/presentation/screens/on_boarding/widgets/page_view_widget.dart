import 'package:flight_app/data/models/on_boarding_model.dart';
import 'package:flutter/material.dart';

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({Key? key, required this.model}) : super(key: key);
  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.asset(
            model.image,
          ),
        ),
        Text(
          model.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 35.0),
          child: Text(
            textAlign: TextAlign.center,
            model.content,
            style: const TextStyle(
              fontSize: 15.0,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
