import 'package:flutter/material.dart';
import 'package:mobile_exam/core/app/view.dart' as base;
import 'package:mobile_exam/screens/exam/bloc.dart';

import '../model/exam.dart';

class ViewState extends base.ViewState {
  ViewState({
    required this.exam,
  });

  final Exam exam;

  @override
  Widget content(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              exam.image!,
              width: 400,
              height: 200,
              // Adjust width and height based on your image size
            ),
            const SizedBox(height: 20),
            Text(
              (context.strings!.examCounterLabel) + (exam.count.toString() ?? ""),
            ),
            const SizedBox(height: 20),
            Text(
              exam.message ?? "",
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                context.bloc.addToCount();
              },
              child: Text(context.strings!.examAddButtonLabel),
            )
          ],
        ),
      ),
    );
  }
}
