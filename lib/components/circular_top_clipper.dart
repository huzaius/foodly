import 'package:flutter/material.dart';


/// A CustomClipper that creates a convex circular top edge.
class CircularTopClipper extends CustomClipper<Path> {
  final double radius;

  const CircularTopClipper({required this.radius});

  @override
  Path getClip(Size size) {
    Path path = Path();
    
    // 1. Start at the bottom-left corner
    path.moveTo(0, size.height);

    // 2. Draw a line to the top-left start of the curve.
    // We adjust the start height based on how much the circle needs to curve.
    // For a shallow curve, we might start a bit down from 0.
    // Here, we start at 0 (top-left) relative to the bounding box vertical alignment,
    // but practically the arc determines the top edge.
    // However, to ensure the arc sits nicely, let's start the path logic:
    
    // We want the arc to span from x=0 to x=width.
    // We need to determine the height difference (sagitta) if we want strict geometry,
    // or we can simply rely on the flutter path engine to draw the arc between two points.
    
    // Move to bottom-right
    path.lineTo(size.width, size.height);
    
    // Move up to top-right (start of the arc)
    // You can adjust '50' if you want straight vertical sides before the curve starts
    // or use '0' if the curve starts immediately from the bounding box top.
    // For a "header" look, the curve usually dips down or bows up.
    // Assuming "Top looks like a circle" means a convex hump (bows up):
    
    // Let's assume the highest point of the circle is at y=0.
    // We need to calculate where the circle intersects the sides of the container (width).
    // This is purely geometric, but 'arcToPoint' handles the heavy lifting.
    
    // We'll draw from Top-Right down to Bottom-Right, then Bottom-Left, then Top-Left?
    // Let's trace counter-clockwise for standard paths:
    
    // 1. Start Bottom-Left
    path.moveTo(0, size.height);
    
    // 2. Line to Top-Left vertical start
    // We pick a vertical offset so the hump has room to curve UPWARDS into the view.
    // If the container height is 300, let's start the curve at y=50 so it peaks at y=0?
    // Actually, simpler approach: Just define the start and end points and the radius.
    
    double curveHeight = 40.0; // How much the curve "humps" up relative to the corners
    
    path.lineTo(0, curveHeight); 

    // 3. Draw the Arc to Top-Right
    // largeArc: false means we take the shorter path (the shallow curve)
    // clockwise: true makes it convex (a hump)
    path.arcToPoint(
      Offset(size.width, curveHeight),
      radius: Radius.circular(radius),
      largeArc: false, 
      clockwise: true,
    );

    // 4. Line to Bottom-Right
    path.lineTo(size.width, size.height);

    // 5. Close the path back to Bottom-Left
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}