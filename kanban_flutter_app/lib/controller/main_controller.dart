import 'dart:convert';

import 'package:get/get.dart' hide Response;
import 'package:dio/dio.dart';
import 'package:kanban_flutter_app/controller/notification_controller.dart';
import '../model/kanban_model.dart';

class MainController extends GetxController {
  List<KanbanModel> data = [];
  RxBool isLoading = false.obs;
  NotificationController isNotification = NotificationController();

  // Dio
  Dio dio = Dio(BaseOptions(
    connectTimeout: 10000,
    receiveTimeout: 10000,
    headers: {
      "content-Type": "application/json",
    },
    validateStatus: (status) {
      return status! < 500;
    },
  ));

  KanbanModel dataNextUp = KanbanModel();
  KanbanModel dataInProgress = KanbanModel();
  KanbanModel dataCompleted = KanbanModel();

  Future<void> getData() async {
    var _response;

    // show loading
    isNotification.loadingShow("Please Wait");

    try {
      _response = await dio.get('https://intonasikopi.com/xaltius-api.php');
      _response = jsonDecode(_response.data);
      print(_response);
      if (_response == "") {
        print("no data");
        return;
      }

      var mappedData =
          _response['list'].map((val) => KanbanModel.fromJson(val)).toList();
      data = List<KanbanModel>.from(mappedData);

      dataNextUp = data[0];
      dataInProgress = data[1];
      dataCompleted = data[2];
      update();
    } on DioError catch (e) {
      isNotification.showToast(
        e.message,
        "error",
      );
      print(e);
    }

    isNotification.loadingDismiss();
  }

  Future<void> setOrder({
    required String type,
    required int from,
    required int to,
  }) async {
    var newArr = [];
    var tmpArrCount;
    var oldArr;
    KanbanModel oldData;

    if (type == "Next Up") {
      oldData = dataNextUp;
    } else if (type == "In Progress") {
      oldData = dataInProgress;
    } else if (type == "Completed") {
      oldData = dataCompleted;
    } else {
      return;
    }

    //moved data
    print(['from', from]);
    print(['to', to]);
    oldArr = oldData.cards;
    tmpArrCount = oldArr.length;
    var movedData = oldArr[from];
    oldArr.removeAt(from);

    //reorder
    for (var i = 0; i < tmpArrCount; i++) {
      print(i);
      if (i == to) {
        newArr.add(movedData);
      }

      if (i + 1 != tmpArrCount) {
        newArr.add(oldArr[i]);
      }
    }

    oldData.cards = newArr;
    if (type == "Next Up") {
      dataNextUp = oldData;
    } else if (type == "In Progress") {
      dataInProgress = oldData;
    } else if (type == "Completed") {
      dataCompleted = oldData;
    }
    update();
  }
}
