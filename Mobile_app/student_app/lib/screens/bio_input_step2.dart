import 'package:flutter/material.dart';

class BioInputStep2 extends StatefulWidget {
  const BioInputStep2({super.key});

  @override
  State<BioInputStep2> createState() => _BioInputStep2State();
}

class _BioInputStep2State extends State<BioInputStep2> {
  final List<String> skills = [];
  final List<String> languages = [];
  TimeOfDay? sleepTime;
  TimeOfDay? wakeTime;
  double studyHours = 2;

  final skillController = TextEditingController();
  final langController = TextEditingController();

  void _pickTime(Function(TimeOfDay) onPicked) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) onPicked(picked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Student Bio - Step 2")),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildChipsInput("Add Skills", skillController, skills),
            _buildChipsInput("Languages Known", langController, languages),
            const SizedBox(height: 16),
            _buildTimePicker("Sleep Time", sleepTime, (t) => setState(() => sleepTime = t)),
            _buildTimePicker("Wake Time", wakeTime, (t) => setState(() => wakeTime = t)),
            const SizedBox(height: 20),
            Text("Daily Study Hours: ${studyHours.toStringAsFixed(1)}"),
            Slider(
              value: studyHours,
              min: 0,
              max: 10,
              divisions: 20,
              label: "${studyHours.toStringAsFixed(1)} hrs",
              onChanged: (val) => setState(() => studyHours = val),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/dashboard');
              },
              child: const Text("Finish Onboarding"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChipsInput(String label, TextEditingController controller, List<String> list) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        Wrap(
          spacing: 6,
          children: list.map((e) => Chip(label: Text(e))).toList(),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(hintText: "Enter $label..."),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                final text = controller.text.trim();
                if (text.isNotEmpty && !list.contains(text)) {
                  setState(() {
                    list.add(text);
                    controller.clear();
                  });
                }
              },
            ),
          ],
        ),
      ]),
    );
  }

  Widget _buildTimePicker(String label, TimeOfDay? time, Function(TimeOfDay) onPick) {
    return ListTile(
      title: Text("$label: ${time?.format(context) ?? 'Not selected'}"),
      trailing: const Icon(Icons.access_time),
      onTap: () => _pickTime(onPick),
    );
  }
}
