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
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.warning_amber,
            color: Colors.red,
            size: 48,
          ),
          const SizedBox(height: 20),
          Text(
            (context.strings!.examErrorLabel) + (exam.statusCode.toString() ?? ""),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text(
              exam.errorMessage ?? "",
              style: context.texts.headlineMedium,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              context.bloc.addToCount();
            },
            child: Text(context.strings!.examAddButtonLabel),
          )
        ],
      ),
    );
  }
}
