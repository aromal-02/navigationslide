/*
import 'package:flutter/material.dart';

/// Entry point of the application.
void main() {
  runApp(const MyApp());
}

/// [Widget] building the [MaterialApp].
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Dock(
            items: const [
              Icons.person,
              Icons.message,
              Icons.call,
              Icons.camera,
              Icons.photo,
            ],
            builder: (e) {
              return  MouseRegion(
             onEnter: (_) {
        setState(() {
          _scale = 1.5; // Enlarge the icon when hovered
        });
      },
      onExit: (_) {
        setState(() {
          _scale = 1.0; // Reset the icon size when not hovered
        });
      },
                child: Container(
                  constraints: const BoxConstraints(minWidth: 60),
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.primaries[e.hashCode % Colors.primaries.length],
                  ),
                  child: Center(
                      child: Icon(
                    e,
                    color: Colors.white,
                    size: 40,
                  )),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Dock<T> extends StatefulWidget {
  const Dock({
    super.key,
    this.items = const [],
    required this.builder,
  });

  final List<T> items;
  final Widget Function(T) builder;

  @override
  State<Dock<T>> createState() => _DockState<T>();
}

class _DockState<T> extends State<Dock<T>> {
  late final List<T> _items = widget.items.toList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromARGB(250, 194, 192, 192),
        ),
        padding: const EdgeInsets.all(4),
        child: ReorderableListView(
          scrollDirection: Axis.horizontal,
          onReorder: (oldIndex, newIndex) {
            setState(() {
              if (newIndex > oldIndex) {
                newIndex -= 1;
              }
              final item = _items.removeAt(oldIndex);
              _items.insert(newIndex, item);
            });
          },
          children: _items
              .asMap()
              .entries
              .map((entry) => GestureDetector(
                    key: ValueKey(entry.value),
                    child: widget.builder(entry.value),
                  ))
              .toList(),
        ),
      )),
    );
  }
}
*/

/*
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Hover Icon Example")),
        body: Center(child: HoverIcon()),
      ),
    );
  }
}

class HoverIcon extends StatefulWidget {
  @override
  _HoverIconState createState() => _HoverIconState();
}

class _HoverIconState extends State<HoverIcon> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _scale = 1.5; // Enlarge the icon when hovered
        });
      },
      onExit: (_) {
        setState(() {
          _scale = 1.0; // Reset the icon size when not hovered
        });
      },
      child: Transform.scale(
        scale: _scale,
        child: Icon(
          Icons.star,
          size: 100,
          color: Colors.blue,
        ),
      ),
    );
  }
}


*/

import 'package:flutter/material.dart';
import 'package:navigation/drag_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 8, 1, 41),
        body: Center(
          child: HoverScaleIcon(),
        ),
      ),
    );
  }
}
