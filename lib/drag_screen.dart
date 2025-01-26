import 'package:flutter/material.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

class HoverScaleIcon extends StatefulWidget {
  const HoverScaleIcon({super.key});

  @override
  _HoverScaleIconState createState() => _HoverScaleIconState();
}

class _HoverScaleIconState extends State<HoverScaleIcon> {
  final List<bool> _isHovered = [false, false, false, false, false];
  final List<IconData> icon = [
    Icons.person,
    Icons.message,
    Icons.call,
    Icons.camera,
    Icons.photo,
  ];

  List<String> imagepath = [
    "assets/images.jpg",
    "assets/images.jpg",
    "assets/images.jpg",
    "assets/images.jpg",
    "assets/images.jpg",
    "assets/images.jpg",
    "assets/images.jpg",
    "assets/images.jpg",
    "assets/images.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(81, 228, 82, 244),
        ),
        height: 600, // Increased height for better image visibility
        child: ReorderableGridView.count(
          onReorder: (oldIndex, newIndex) {
            setState(() {
              String path = imagepath
                  .removeAt(oldIndex); // Use setState to trigger UI update
              imagepath.insert(newIndex, path); // Update the order of images
            });
          },
          crossAxisCount: 3,
          childAspectRatio: 1.5,
          children: imagepath
              .map((String path) => ListView.builder(
                      key: ValueKey(path),
                      itemBuilder: (context, index) {
                        return MouseRegion(
                            onEnter: (_) => setState(() {
                                  _isHovered[index] = true;
                                }),
                            onExit: (_) => setState(() {
                                  _isHovered[index] = false;
                                }),
                            child: AnimatedContainer(
                              key: ValueKey(index),
                              duration: const Duration(milliseconds: 100),
                              transform: Matrix4.identity()
                                ..scale(_isHovered[index] ? 1.2 : 1.0),
                              child: Card(
                                key: ValueKey(path),
                                child: Image.asset(path),
                              ),
                            ));
                      })
                  //  Card(
                  //       key: ValueKey(path),
                  //       child: Image.asset(path),
                  //     )
                  )
              .toList(),
        ),
      ),
    );
  }
}



/*
List.generate(icon.length, (index) {
            key:
            ValueKey(index);

            return MouseRegion(
              onEnter: (_) => setState(() {
                _isHovered[index] = true;
              }),
              onExit: (_) => setState(() {
                _isHovered[index] = false;
              }),
              child: AnimatedContainer(
                key: ValueKey(index),
                duration: const Duration(milliseconds: 100),
                transform: Matrix4.identity()
                  ..scale(_isHovered[index] ? 1.2 : 1.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  width: 50,
                  height: 50,
                  child: Icon(
                    icon[index],
                    size: 35,
                  ),
                ),
              ),
            );
          }
*/