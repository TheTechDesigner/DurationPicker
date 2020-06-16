import 'package:flutter/material.dart';
import 'package:flutter_duration_picker/flutter_duration_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFC41A3B),
        primaryColorLight: Color(0xFFFBE0E6),
        // accentColor: Color(0xFF1B1F32),
        accentColor: Color(0xFFC41A3B),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = 'Duration Picker';
  Duration _duration = Duration(hours: 0, minutes: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: DurationPicker(
          duration: _duration,
          snapToMins: 5.0,
          onChange: (_value) {
            this.setState(() => _duration = _value);
          },
        ),
      ),
      floatingActionButton: Builder(
        builder: (BuildContext context) => FloatingActionButton(
          onPressed: () async {
            Duration _durationResult = await showDurationPicker(
              context: context,
              initialTime: Duration(minutes: 30),
            );
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text("Duration: $_durationResult"),
              ),
            );
          },
          child: Icon(Icons.timer),
        ),
      ),
    );
  }
}
