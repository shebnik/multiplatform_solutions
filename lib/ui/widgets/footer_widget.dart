import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  final void Function(String url) loadClick;

  final TextEditingController _textFieldController = TextEditingController();

  FooterWidget({
    Key? key,
    required this.loadClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFEEEEEE),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(color: Colors.black, height: 2),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textFieldController,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                SizedBox(
                  height: 50,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () => loadClick(_textFieldController.text),
                    child: const Text(
                      'LOAD',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
