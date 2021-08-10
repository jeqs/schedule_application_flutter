import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule_application/model/event_data_source.dart';
import 'package:schedule_application/provider/event_provider.dart';
import 'package:schedule_application/widget/tasks_widget.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class TrainersWidget extends StatelessWidget {
  final List<String> data = [];

  ListViewSeparated() {
    for (var i = 0; i < 100; i++) {
      data.add("Data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
        color: Colors.black,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            height: 50,
            color: Colors.blue,
            child: Center(
              child: Text(
                data[index],
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
      },
      itemCount: data.length,
    );
  }
}
