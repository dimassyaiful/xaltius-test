// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kanban_flutter_app/color_pallete.dart';
import 'package:kanban_flutter_app/controller/main_controller.dart';
import 'package:kanban_flutter_app/model/kanban_model.dart';

class KanbanPage extends StatelessWidget {
  const KanbanPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainController isController = Get.find();

    isController.getData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text("Xaltius Board"),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.menu),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          padding: EdgeInsets.all(20),
          child: GetBuilder<MainController>(
            init: isController,
            builder: (ctrl) {
              return Row(children: [
                Board(
                  title: "Next Up",
                  data: ctrl.dataNextUp,
                ),
                Board(
                  title: "In Progress",
                  data: ctrl.dataInProgress,
                ),
                Board(
                  title: "Completed",
                  data: ctrl.dataCompleted,
                ),
              ]);
            },
          ),
        ),
      ),
    );
  }
}

class Board extends StatelessWidget {
  final String title;
  final KanbanModel data;
  Board({
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    List cards = data.cards ?? [];
    bool isCompleted = false;
    if (title == "Completed") {
      isCompleted = true;
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: 300,
      height: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 6,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  color: Colors.black,
                  textColor: Colors.white,
                  onPressed: () {},
                  child: Text('+ ADD TASK'),
                ),
              ),
            ],
          ),
          cards.isEmpty
              ? Padding(padding: EdgeInsets.all(20), child: Text("No Data"))
              : Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Container(
                    child: (cards.isEmpty)
                        ? Container()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (var i = 0; i < cards.length; i++)
                                Cards(
                                    totalData: cards.length,
                                    index: i,
                                    data: cards[i],
                                    isCompleted: isCompleted,
                                    title: title)
                            ],
                          ),
                  ),
                )
        ],
      ),
    );
  }
}

class Cards extends StatelessWidget {
  final index;
  final data;
  final isCompleted;
  final totalData;
  final title;
  const Cards({
    Key? key,
    required this.totalData,
    required this.index,
    required this.data,
    required this.isCompleted,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainController isController = Get.find();

    dynamic dueDate = data['dueDate'];
    DateTime date1 = DateTime.parse(dueDate);
    DateTime now = DateTime.now();

    DateTime to = DateTime(date1.year, date1.month, date1.day);
    DateTime from = DateTime(now.year, now.month, now.day);
    int dayCount = (to.difference(from).inHours / 24).round();
    String formattedDate = DateFormat('dd MMMM yyy').format(date1);

    Color bgColor = ColorPallete.grey;
    Color textColor = Colors.black;
    if (isCompleted != true) {
      if (dayCount < 1) {
        bgColor = ColorPallete.redLight;
        textColor = ColorPallete.red;
      } else if (dayCount <= 2) {
        bgColor = ColorPallete.orangeLight;
        textColor = ColorPallete.orange;
      } else if (dayCount > 2) {
        bgColor = ColorPallete.greenLight;
        textColor = ColorPallete.green;
      }
    }

    Widget widget = Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      // margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data['name'],
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: bgColor,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.access_time,
                  color: textColor,
                ),
                Text(
                  "  " + formattedDate,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );

    DragTarget dragTarget = DragTarget<int>(
      builder: (
        BuildContext context,
        List<dynamic> accepted,
        List<dynamic> rejected,
      ) {
        if (accepted.isEmpty) {
          return Container(
            height: 20,
          );
        }

        if (accepted[0] == index) {
          return Container(
            height: 0,
          );
        }

        double height = 10;
        double width = double.infinity;
        Color color = Colors.white;
        if (!accepted.isEmpty) {
          color = Colors.grey.shade400;
          height = 50;
          width = double.infinity;
        }

        return Container(
          margin: EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            color: color,
          ),
          height: height,
          width: width,
          child: Center(
            child: null,
          ),
        );
      },
      onAccept: (int data) {
        int from = data;
        int to = index;

        isController.setOrder(type: title, from: from, to: to);
      },
      onMove: (val) {},
    );

    return Column(
      children: [
        index == 0 ? dragTarget : Container(),
        Draggable<int>(
            // Data is the value this Draggable stores.
            data: index,
            child: widget,
            feedback: Container(
              width: 300,
              child: widget,
            ),
            childWhenDragging: Container()),
        index <= totalData ? dragTarget : Container(),
      ],
    );
  }
}
