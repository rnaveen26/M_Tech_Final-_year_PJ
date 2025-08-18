import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class BioInputStep1 extends StatefulWidget {
  const BioInputStep1({super.key});

  @override
  State<BioInputStep1> createState() => _BioInputStep1State();
}

class _BioInputStep1State extends State<BioInputStep1> {
  String? studyPreference;
  final List<String> studyOptions = ["Morning", "Evening"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Onboarding"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.grey[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Step indicator
            const Text(
              "Step 1 of 3",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 4),
            const LinearProgressIndicator(
              value: 0.33,
              backgroundColor: Colors.deepPurpleAccent,
              color: Colors.deepPurple,
              minHeight: 6,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            const SizedBox(height: 20),

            // Welcome message
            const Text(
              "Welcome! 👋 Let's get to know you.",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Lottie illustration
            Center(
              child: Lottie.asset(
                'assets/lottie/student.json',
                height: 180,
              ),
            ),
            const SizedBox(height: 10),

            // Form
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildField("Name"),
                    _buildField("Email"),
                    _buildField("Course"),
                    _buildField("Semester"),
                    _buildField("Favorite Subjects"),
                    _buildField("Hobbies"),
                    _buildDropdown("Study Preference", studyOptions, studyPreference,
                        (val) {
                      setState(() => studyPreference = val);
                    }),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, '/bio2');
                        },
                        icon: const Icon(Icons.arrow_forward),
                        label: const Text("Submit & Continue"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(fontSize: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> options, String? value, ValueChanged<String?> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        items: options
            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
