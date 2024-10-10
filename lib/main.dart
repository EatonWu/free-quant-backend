import 'package:flutter/material.dart';
import 'package:interactive_chart/interactive_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Backtest Frontend',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BacktestFrontendPage(title: 'Backtest Frontend'),
    );
  }
}

class BacktestFrontendPage extends StatefulWidget {
  const BacktestFrontendPage({super.key, required this.title});
  final String title;

  @override
  State<BacktestFrontendPage> createState() => _BacktestFrontendPageState();
}

class _BacktestFrontendPageState extends State<BacktestFrontendPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 8,
            child: GraphView(),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SideInputScrollable(),
            ),
          )
        ]
      ),
    );
  }
}

class SideInputScrollable extends StatefulWidget {
  const SideInputScrollable({super.key});

  @override
  State<SideInputScrollable> createState() => _SideInputScrollableState();
}

class _SideInputScrollableState extends State<SideInputScrollable> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            child: TextField(
              controller: TextEditingController()..text = 'AAPL',
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Symbol',
              ),
            ),
            )
        ),
        Expanded(
          flex: 15,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(color: Colors.green, height: 100),
                Container(color: Colors.yellow, height: 100),
                Container(color: Colors.orange, height: 100),
                Container(color: Colors.pink, height: 100),
                Container(color: Colors.purple, height: 100),
                Container(color: Colors.brown, height: 100),
                Container(color: Colors.teal, height: 100),
                Container(color: Colors.indigo, height: 100),
                Container(color: Colors.lime, height: 100),
                Container(color: Colors.cyan, height: 100),
                Container(color: Colors.amber, height: 100),
                Container(color: Colors.deepOrange, height: 100),
                Container(color: Colors.lightBlue, height: 100),
                Container(color: Colors.lightGreen, height: 100),
                Container(color: Colors.deepPurple, height: 100),
                Container(color: Colors.grey, height: 100),
                Container(color: Colors.blueGrey, height: 100),
                Container(color: Colors.black, height: 100),
              ],
            ),
          ),
        ),
        // button that sends the data to the backend
        Expanded(
          flex: 1,
          // rounded rect button
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              // send data to backend
            },
            child: const Text('Run Backtest'),
          ),
        ),
      ],
    );
  }
}

class GraphView extends StatefulWidget {
  List<CandleData> candles;
  GraphView({super.key, required this.candles});

  @override
  State<GraphView> createState() => _GraphViewState();
}

class _GraphViewState extends State<GraphView> {
  @override
  Widget build(BuildContext context) {
    return InteractiveChart(candles: widget.candles);
  }
}

class StatView extends StatefulWidget {
  const StatView({super.key});

  @override
  State<StatView> createState() => _StatViewState();
}

class _StatViewState extends State<StatView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
