import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/decision_service.dart';
import 'result_screen.dart';

class ProcessingScreen extends StatefulWidget {

  final String decision;

  const ProcessingScreen({required this.decision, super.key});

  @override
  State<ProcessingScreen> createsState() => _ProcessingScreenState();
}

class _ProcessingScreenState extends State<ProcessingScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final ds = Provider.of<DecisionService>(context, list: false);

      await ds.analyzeDecision(widget.decision);

      if (mounted && ds.errorMessage == null) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ResultScreen()));
      }

    });
  }

  @override
  Widget build(BuildContext content) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}