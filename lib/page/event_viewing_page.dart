import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule_application/model/event.model.dart';
import 'package:schedule_application/page/event_editing_page.dart';
import 'package:schedule_application/provider/event_provider.dart';

import '../util.dart';

class EventViewingPage extends StatelessWidget {
  final Event event;

  const EventViewingPage({
    Key key,
    this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            leading: CloseButton(),
            actions: buildViewingActions(context, event)),
        body: ListView(padding: EdgeInsets.all(12), children: <Widget>[
          buildDateTime(event),
          SizedBox(
            height: 32,
          ),
          Text(
            event.title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Text(
            event.description,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
        ]),
      );

  Widget buildDateTime(Event event) {
    return Column(
      children: [
        buildDate(event.isAllDay ? 'All-day' : 'From', event.from),
        if (!event.isAllDay) buildDate('To', event.to),
      ],
    );
  }

  Widget buildDate(String title, DateTime date) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        SizedBox(
          width: 20,
          height: 30,
        ),
        Text(Utils.toDateTime(date))
      ],
    );
  }

  List<Widget> buildViewingActions(BuildContext context, Event event) => [
        IconButton(
            icon: Icon(Icons.edit),
            onPressed: () =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => EventEditingPage(
                          event: event,
                        )))),
        IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              final provider =
                  Provider.of<EventProvider>(context, listen: false);
              provider.removeEvent(event);
              Navigator.of(context).pop();
            })
      ];
}
