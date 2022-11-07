import 'package:flutter/material.dart';
import 'package:precursorapp/Properties.dart';
import 'package:sticky_headers/sticky_headers.dart';

class StickyHeaders extends StatelessWidget {
  const StickyHeaders({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        home: StickyHeadersMain(),
        debugShowCheckedModeBanner: false,
      );
}

class StickyHeadersMain extends StatefulWidget {
  const StickyHeadersMain({super.key});

  @override
  State<StickyHeadersMain> createState() => _StickyHeadersMainState();
}

class _StickyHeadersMainState extends State<StickyHeadersMain> {
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView.builder(
        itemCount: 50,
        itemBuilder: (context, item) => StickyHeaderBuilder(
          builder: (context, stuckAmount) {
            stuckAmount = 1 - stuckAmount.clamp(0, 1);
            return Container(
              padding: const EdgeInsets.all(16),
              width: size!.width,
              color: Color.lerp(grey, pink, stuckAmount),
              child: Text('Sticky Header $item'),
            );
          },
          overlapHeaders: true,
          content: Image(
            image: const AssetImage('images/image-1.png'),
            fit: BoxFit.cover,
            height: 200,
            width: size!.width,
          ),
        ),
      ),
    );
  }
}
