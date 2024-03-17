import 'package:flutter/material.dart';
import 'package:rent_it_flutter/widgets/custom_shapes.dart';

class RShapeTopWidget extends StatelessWidget {
  const RShapeTopWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return RShape(
      child: SizedBox(
        height: 300,
        child: Stack(
          children: <Widget>[
            Container(
              color: const Color.fromRGBO(159, 21, 33, 1),
              height: 300,
            ),
            Positioned(
                right: -250,
                top: -250,
                child: Container(
                  width: 450,
                  height: 450,
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(450),
                      color: const Color.fromRGBO(226, 42, 50, 1)),
                )),
            Column(
              children: [child],
            )
          ],
        ),
      ),
    );
  }
}

class RShape extends StatelessWidget {
  const RShape({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: RClipPath(), child: child);
  }
}
