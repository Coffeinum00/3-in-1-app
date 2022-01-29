import 'package:calc_to_do_app/widgets/text_widget.dart';
import 'package:calc_to_do_app/widgets/text_widget_2.dart';
import 'package:flutter/material.dart';

class ToDoApp extends StatefulWidget {
  // statefull żeby appka myślała i była reaktywna
  // gdy statefull użyj restart (zielona strzałka) a nie hot reload, bo appka już zapamiętuje!

  ToDoApp({Key? key}) : super(key: key);

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  List<Map> myTasks = [];

  @override
  void initState() {
    super.initState();
    // przesuwanie całej linijki kodu to alt+strzałkaGóra/Doł ;)
  }

  TextEditingController controller = TextEditingController();

  String myInput = '';
  bool? checkbox;

  @override
  Widget build(BuildContext context) {
    myTasks.sort(
        (a, b) => a['checkbox'].toString().compareTo(b['checkbox'].toString()));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: MyTextWidget(
          text: 'To do',
          color: Colors.lightBlue[900],
        ),
        actions: [
          mybuttonicon(),
        ],
      ),
      body: ListView(
        children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 20,
              // height: 60.0,
              color: Colors.lightBlue[200],
              child: TextFormField(
                // onChanged: (string) {
                //   setState(() {
                //     myInput = string;
                //     myTasks.add(myInput);
                //   });
                // },
                controller: controller,
                minLines: 1,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  prefixIcon: mybuttonicon(),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: myTasks.length,
                itemBuilder: (context, index) {
                  return mytask(index);
                }),
          )
        ],
      ),
    );
  }

  IconButton mybuttonicon() {
    return IconButton(
      onPressed: () {
        Map newMap = {};
        newMap['checkbox'] = false;
        newMap['text'] = controller.text;
        setState(() {
          myTasks.add(newMap);
          controller.clear();
        });
      },
      icon: const Icon(Icons.add),
    );
  }

  Widget mytask(index) {
    // bool ischecked = false;
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd ||
            direction == DismissDirection.endToStart) myTasks.removeAt(index);
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Checkbox(
                  value: myTasks[index].values.elementAt(0),
                  onChanged: (ischecked) {
                    setState(() {
                      bool czekbox = myTasks[index].values.elementAt(0);
                      myTasks[index]['checkbox'] = !czekbox;
                    });
                  }),
              MyTextWidget2(
                text: myTasks[index].values.elementAt(1).toString(),
                color: Colors.blueGrey[200],
                size: 25.0,
                checkbox: myTasks[index].values.elementAt(0),
              ),
            ],
          ),
          Divider(
            thickness: 3,
            color: Colors.lightBlue[100],
          )
        ],
      ),
    );
  }
}
