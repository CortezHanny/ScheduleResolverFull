import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import '../services/decision_service.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen ({super.key});

  @override
  Widget build(BuildContext content) {
    final result = Provider.of<DecisionService>(context).currentResult;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Analyze Results'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Pros/Cons'),
              Tab(text: 'Comparison'),
              Tab(text: 'SWOT'),
            ],
          ),
        ),

        body: TabBarView(
          children: [
            Markdown(data: result!.decision),
            Markdown(data: result.comparisonTable),
            Markdown(data: result.swotAnalysis),
          ],
        ),
      ),
    );
  }
}