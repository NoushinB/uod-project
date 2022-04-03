import 'package:flutter/material.dart';
import 'package:uod/presentation/components/my_button.dart';
import 'package:uod/presentation/pages/successful_page.dart';

class EventDetailPage extends StatefulWidget {
  const EventDetailPage({Key? key}) : super(key: key);

  @override
  State<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 32),
            const Expanded(
              child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry."
                  " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                  "when an unknown printer took a galley of type and scrambled it to make a type specimen book. "
                  "It has survived not only five centuries, but also the leap into electronic typesetting,"
                  " remaining essentially unchanged. "
                  "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,"
                  " and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: MyButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SuccessfulPage()));
              }, textName: "Confirm Attendance"),
            ),
          ],
        ),
      ),
    );
  }
}
