import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _glassNoTEController =
      TextEditingController(text: "1");

  List<WaterTracker> waterTrackerList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Water Tracker",
          style: TextStyle(fontSize: 18),
        )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildWaterTrackCounter(),
          SizedBox(
            height: 24,
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("Time"),
                      subtitle: Text("Date"),
                      leading: Text("1"),
                      trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete_forever_rounded,
                            color: Colors.red,
                          )),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 2,
                      thickness: 2,
                    );
                  },
                  itemCount: 4))
        ],
      ),
    );
  }

  Column _buildWaterTrackCounter() {
    return Column(
          children: [
            Text(
              getTotalGlassCount().toString(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const Text("Glass/s"),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                  width: 50,
                  child: TextField(
                    controller: _glassNoTEController,
                    textAlignVertical: TextAlignVertical(y: -1),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2)),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 5),
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      _addNewWaterTrack();
                    },
                    child: Text("Add")),
              ],
            ),
          ],
        );
  }

  int getTotalGlassCount() {
    int counter = 0;
    for (WaterTracker wt in waterTrackerList) {
      counter += wt.noOfGlasses;
    }
    return counter;
  }

  void _addNewWaterTrack() {
    if (_glassNoTEController.text.isEmpty) {
      _glassNoTEController.text = "1";
    }
    final int noOfGlasses = int.tryParse(_glassNoTEController.text) ?? 1;
    WaterTracker waterTracker = WaterTracker(
      noOfGlasses: noOfGlasses,
      dateTime: DateTime.now(),
    );
    waterTrackerList.add(waterTracker);
    setState(() {});
  }
}

class WaterTracker {
  final int noOfGlasses;
  final DateTime dateTime;

  WaterTracker({required this.noOfGlasses, required this.dateTime});
}
