import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:student_app/screens/chatbot_screen.dart'; // update with actual path

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Dashboard"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🎓 Student Summary
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.deepPurple,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: const Text("Naveen Kumaran"),
                  subtitle: const Text("CSE - Mid Level Performer"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ),
              const SizedBox(height: 16),

              // 📈 Habit Progress Circle
              Center(
                child: CircularPercentIndicator(
                  radius: 80,
                  lineWidth: 12,
                  percent: 0.72,
                  center: const Text("72%", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  progressColor: Colors.green,
                  backgroundColor: Colors.grey[300]!,
                  circularStrokeCap: CircularStrokeCap.round,
                  animation: true,
                  header: const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text("Habit Tracker Progress", style: TextStyle(fontSize: 16)),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // 🧘 Yoga Prompt
              Card(
                color: Colors.indigo[50],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: SwitchListTile(
                  title: const Text("Did you complete 5-min breathing today?"),
                  value: true,
                  onChanged: (val) {
                    // TODO: save status
                  },
                  secondary: const Icon(Icons.self_improvement, color: Colors.indigo),
                ),
              ),
              const SizedBox(height: 16),

              // 💬 Chatbot Button
              Center(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.chat_bubble),
                  label: const Text("Ask AI Assistant"),
                  onPressed: () {
                    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ChatbotScreen()),
  );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    backgroundColor: Colors.deepPurple,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // 🏆 Rank or Level
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  leading: const Icon(Icons.emoji_events, color: Colors.amber),
                  title: const Text("Your Current Rank"),
                  subtitle: const Text("Class Rank: #14"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
