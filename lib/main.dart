import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule_application/page/event_editing_page.dart';
import 'package:schedule_application/provider/event_provider.dart';
import 'package:schedule_application/widget/calendar_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => EventProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Training Organization",
          themeMode: ThemeMode.dark,
          darkTheme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: Colors.black,
              accentColor: Colors.white,
              primaryColor: Colors.green[300]),
          home: MainPage(),
        ),
      );
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Training Organization Calendar"),
          centerTitle: true,
        ),
        body: CalendarWidget(),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add, color: Colors.white),
            backgroundColor: Colors.green[300],
            onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => EventEditingPage()),
                )),
      );
}
