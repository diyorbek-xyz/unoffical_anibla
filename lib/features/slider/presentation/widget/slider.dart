import 'dart:async';
import 'package:flutter/material.dart';
import 'package:application/core/constants/theme.dart';

class SliderWidget extends StatefulWidget {
  final Duration autoPlaySpeed;
  final Duration animationDuration;
  final List<Widget> items;
  const SliderWidget({
    super.key,
    this.autoPlaySpeed = const Duration(seconds: 5),
    this.animationDuration = const Duration(milliseconds: 200),
    this.items = const [Text("Hello"), Text("World"), Text("World"), Text("World"), Text("End")],
  });

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int currentIndex = 0;

  void setIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void nextPage() {
    setIndex((currentIndex + 1) % widget.items.length);
  }

  void autoPlay() async {
    while (mounted) {
      await Future.delayed(widget.autoPlaySpeed);
      nextPage();
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, autoPlay);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: widget.animationDuration,
      transitionBuilder: (child, animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      layoutBuilder: (currentChild, previousChildren) {
        List<MapEntry<int, Widget>> indicator = widget.items.asMap().entries.toList();
        return Stack(
          alignment: AlignmentGeometry.bottomCenter,
          children: [
            currentChild ?? Placeholder(),
            Padding(
              padding: EdgeInsetsGeometry.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 5,
                children: indicator
                    .map(
                      (e) => InkWell(
                        onTap: () => setIndex(e.key),
                        borderRadius: BorderRadius.circular(10),
                        child: AnimatedContainer(
                          duration: widget.animationDuration,
                          width: e.key == currentIndex ? 30 : 15,
                          height: 15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: e.key == currentIndex ? primary : secondary,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        );
      },
      child: Container(
        key: ValueKey(currentIndex),
        height: 300,
        width: double.infinity,
        color: surface,
        child: widget.items[currentIndex],
      ),
    );
  }
}
