import 'package:flutter/material.dart';

class Photo extends StatefulWidget {
  const Photo({super.key});

  @override
  State<Photo> createState() => _PhotoState();
}

class _PhotoState extends State<Photo> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotationX;
  bool showSecondImage = false;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    rotationX = Tween<double>(
      begin: 0.0,
      end: 2 * 3.141592653589793, // 180°
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    controller.addListener(() {
      if (controller.value > 0.5 && !showSecondImage) {
        setState(() => showSecondImage = true);
      }
      if (controller.value < 0.5 && showSecondImage) {
        setState(() => showSecondImage = false);
      }
    });

    _startLoop();
  }

  Future<void> _startLoop() async {
    while (mounted) {
      await Future.delayed(const Duration(seconds: 5));
      await controller.forward();
      await Future.delayed(const Duration(seconds: 10));
      await controller.reverse();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: rotationX,
      builder: (context, child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(rotationX.value),
          child: child,
        );
      },
      child: Container(
        height: 130,
        width: 130,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.5),
              spreadRadius: 3,
              blurRadius: 8,
            ),
          ],
        ),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(
            showSecondImage ? "assets/emoji.png" : "assets/profil.png",
          ),
        ),
      ),
    );
  }
}
