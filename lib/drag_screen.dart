import 'package:flutter/material.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

class HoverScaleIcon extends StatefulWidget {
  const HoverScaleIcon({super.key});

  @override
  _HoverScaleIconState createState() => _HoverScaleIconState();
}

class _HoverScaleIconState extends State<HoverScaleIcon> {
  final List<IconData> icons = [
    Icons.person,
    Icons.message,
    Icons.call,
    Icons.camera,
    Icons.photo,
  ];
  final List<bool> _isHovered = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(53, 228, 82, 244),
        ),
        height: 100,
        child: ReorderableGridView.builder(
          itemCount: icons.length,
          onReorder: (oldIndex, newIndex) {
            setState(() {
              final icon = icons.removeAt(oldIndex);
              icons.insert(newIndex, icon);
              _isHovered[oldIndex] = false;
            });
          },
          dragWidgetBuilder: (index, child) {
            return Transform.scale(
              scale: 1.2,
              child: child,
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return MouseRegion(
              key: ValueKey(icons[index]),
              onEnter: (_) => setState(() {
                _isHovered[index] = true;
              }),
              onExit: (_) => setState(() {
                _isHovered[index] = false;
              }),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                transform: Matrix4.identity()
                  ..scale(_isHovered[index] ? 1.2 : 1.0),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(250, 229, 229, 229),
                    ),
                    height: 50,
                    width: 50,
                    child: Icon(
                      icons[index],
                      size: 20,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
