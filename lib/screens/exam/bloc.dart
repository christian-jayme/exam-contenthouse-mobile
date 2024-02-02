export 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:mobile_exam/core/app/bloc.dart' as base;
import 'package:mobile_exam/core/extensions/common.dart';
import 'package:mobile_exam/core/extensions/map.dart';
import 'package:mobile_exam/core/services/server.dart';
import 'package:mobile_exam/screens/exam/model/exam.dart';

import 'views/main.dart' as main_view;
import 'views/loading.dart' as loading_view;
import 'views/error.dart' as error_view;

extension Extension on BuildContext {
  Bloc get bloc => read<Bloc>();
}

class Bloc extends base.Bloc {
  Bloc(BuildContext context)
      : super(loading_view.ViewState(), context: context);

  @override
  void init() async {
    final service = context.server;
    fetchData(service);
  }

  void addToCount() async {
    final service = context.server;
    service.addToCount(1);

    emit(loading_view.ViewState());

    await fetchData(service);
  }

  Future<void> fetchData(Server service) async {
    Exam exam = Exam.fromJson(await service.data);
      if(!exam.isSuccess) {
        emit(error_view.ViewState(exam: exam));
        return;
      }
      emit(main_view.ViewState(exam: exam));

  }
}
