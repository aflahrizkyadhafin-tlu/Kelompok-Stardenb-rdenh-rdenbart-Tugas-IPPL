import 'package:flutter/material.dart';

class EditFieldPage extends StatefulWidget {
  final String title;
  final String initialValue;
  final int maxLength;
  final String? subtitle;
  final int maxLines;
  final TextInputType keyboardType;

  const EditFieldPage({
    super.key,
    required this.title,
    required this.initialValue,
    required this.maxLength,
    this.subtitle,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<EditFieldPage> createState() => _EditFieldPageState();
}

class _EditFieldPageState extends State<EditFieldPage> {
  late TextEditingController _controller;
  int _currentLength = 0;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
    _currentLength = widget.initialValue.length;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leadingWidth: 80,
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'Batal',
            style: TextStyle(color: Colors.black87, fontSize: 16),
          ),
        ),
        title: Text(
          'Edit ${widget.title}-umum',
          style: const TextStyle(color: Colors.black54, fontSize: 14),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, _controller.text);
            },
            child: const Text(
              'Simpan',
              style: TextStyle(
                color: Color(0xFFE31E24),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                color: Color(0xFF9E1014),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            if (widget.subtitle != null) ...[
              const SizedBox(height: 6),
              Text(
                widget.subtitle!,
                style: const TextStyle(color: Colors.black54, fontSize: 13),
              ),
            ],

            const SizedBox(height: 16),

            TextField(
              controller: _controller,
              maxLength: widget.maxLength,
              maxLines: widget.maxLines,
              keyboardType: widget.keyboardType,
              onChanged: (text) {
                setState(() {
                  _currentLength = text.length;
                });
              },
              decoration: InputDecoration(
                counterText: '',
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 6),

            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '$_currentLength/${widget.maxLength}',
                style: const TextStyle(color: Colors.black45, fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
