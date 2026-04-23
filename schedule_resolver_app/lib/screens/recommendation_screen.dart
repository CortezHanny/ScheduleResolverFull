import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/ai_schedule_service.dart';

class RecommendationScreen extends StatelessWidget {
  const RecommendationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final aiService = Provider.of<AiScheduleService>(context);
    final analysis = aiService.currentAnalysis;

    if (analysis == null) {
      return Scaffold(
        backgroundColor: const Color(0xFFF3E5F5),
        appBar: AppBar(
          title: const Text('AI Recommendation', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.deepPurple,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.auto_awesome, size: 80, color: Colors.deepPurple.withOpacity(0.3)),
              const SizedBox(height: 16),
              const Text('No recommendation available yet.', style: TextStyle(color: Colors.deepPurple, fontSize: 16)),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5),
      appBar: AppBar(
        title: const Text(
          'AI Schedule Recommendation',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSection(
                context,
                'Detected Conflicts',
                analysis.conflicts,
                Colors.redAccent,
                Icons.warning_amber_rounded
            ),
            const SizedBox(height: 16),
            _buildSection(
                context,
                'Ranked Tasks',
                analysis.rankedTasks,
                Colors.deepPurple,
                Icons.format_list_numbered
            ),
            const SizedBox(height: 16),
            _buildSection(
                context,
                'Recommended Schedule',
                analysis.recommendedSchedule,
                Colors.green,
                Icons.calendar_today
            ),
            const SizedBox(height: 16),
            _buildSection(
                context,
                'Explanation',
                analysis.explanation,
                Colors.orangeAccent,
                Icons.lightbulb_outline
            ),
            const SizedBox(height: 30),

            // Back Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.deepPurple, width: 2),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Back to Dashboard',
                  style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, String content, Color accentColor, IconData icon) {
    return Card(
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(color: accentColor, width: 6),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, size: 24, color: accentColor),
                  const SizedBox(width: 10),
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(),
              ),
              Text(
                content,
                style: TextStyle(
                    fontSize: 15,
                    height: 1.6,
                    color: Colors.grey.shade800
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}