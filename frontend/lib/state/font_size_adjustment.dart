import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:frontend/state/theme_provider.dart';

class FontSizeAdjustment extends StatelessWidget {
  const FontSizeAdjustment({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    double currentFontSize = themeProvider.fontSize;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adjust Font Size'),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Font Size: ${currentFontSize.toStringAsFixed(1)}',
              style: TextStyle(fontSize: currentFontSize),
            ),
            Slider(
              value: currentFontSize,
              min: 12,
              max: 22,
              divisions: 10,
              label: currentFontSize.toStringAsFixed(1),
              onChanged: (value) {
                themeProvider.setFontSize(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
