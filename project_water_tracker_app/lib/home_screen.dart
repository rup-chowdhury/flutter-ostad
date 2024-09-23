import 'package:flutter/material.dart';
import 'package:project_water_tracker_app/water_tracker.dart';

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
          const SizedBox(
            height: 24,
          ),
          Expanded(child: _buildWaterTrackListView())
        ],
      ),
    );
  }

  Widget _buildWaterTrackListView() {
    return ListView.separated(
      itemCount: waterTrackerList.length,
      itemBuilder: (context, index) {
        return _buildWaterTrackListTile(index);
      },
      separatorBuilder: (context, index) {
        return const Divider(
          height: 2,
          thickness: 2,
        );
      },
    );
  }

  ListTile _buildWaterTrackListTile(int index) {
    WaterTracker waterTracker = waterTrackerList[index];
    return ListTile(
        title: Text("${waterTracker.dateTime.hour}:${waterTracker.dateTime.minute}:${waterTracker.dateTime.second}"),
        subtitle: Text("${waterTracker.dateTime.day}/${waterTracker.dateTime.month}/${waterTracker.dateTime.year}"),
        leading: CircleAvatar(child: Text("${waterTracker.noOfGlasses}")),
        trailing: IconButton(
            onPressed: () {
              _onTapDeleteWaterTrack(index);
            },
            icon: const Icon(
              Icons.delete_forever_rounded,
              color: Colors.red,
            )),
      );
  }

  Widget _buildWaterTrackCounter() {
    return Column(
      children: [
        Text(
          getTotalGlassCount().toString(),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
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
                textAlignVertical: const TextAlignVertical(y: -1),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2)),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue, width: 5),
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            TextButton(
                onPressed: () {
                  _onTapAddWaterTrack();
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

  void _onTapAddWaterTrack() {
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

  void _onTapDeleteWaterTrack(int index){
    waterTrackerList.removeAt(index);
    setState(() {});
  }

  @override
  void dispose() {
    _glassNoTEController.dispose();
    super.dispose();
  }
}


