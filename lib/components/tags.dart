import 'package:flutter/material.dart';
import 'package:line_up_front_end/screen/const/custom_font_weight.dart';

import 'colors.dart';

class TagRadioGroup extends StatefulWidget {
  final List<String> labels;
  final ValueChanged<String> onChanged;

  TagRadioGroup({required this.labels, required this.onChanged});

  @override
  _TagRadioGroupState createState() => _TagRadioGroupState();
}

class _TagRadioGroupState extends State<TagRadioGroup> {
  String? _selectedLabel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.labels.map((label) {
        return TagRadioButton(
          label: label,
          isSelected: _selectedLabel == label,
          onChanged: (bool isSelected) {
            if (isSelected) {
              setState(() {
                _selectedLabel = label;
              });
              widget.onChanged(label);
            }
          },
        );
      }).toList(),
    );
  }
}

class TagRadioButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final ValueChanged<bool> onChanged;

  TagRadioButton({
    required this.label,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        onChanged(!isSelected);
      },
      child: Tag(
        tag: label,
        isSelected: isSelected,
      ),
    );
  }
}
class Tag extends StatelessWidget{
  final String tag;
  final Color textColor;
  final double fontSize;
  final double padding;
  final double borderRadius;
  final double borderWidth;
  final double height;
  final Color borderColor;
  final Gradient gradient;
  final isSelected;

  Tag({
    required this.tag,
    this.textColor = const Color(0xFF606060),
    this.fontSize = 12.0,
    this.padding = 10.0,
    this.borderRadius = 15.0,
    this.borderWidth = 1.0,
    this.height = 32.0,
    this.borderColor = const Color(0xFF606060),
    this.gradient = AppColors.primaryGradient,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final gradientShader = gradient?.createShader(Rect.fromLTWH(0, 0, height, height));

    return Padding(
        padding: const EdgeInsets.only(left: 9,right: 9,top: 11,bottom: 11),
      child: CustomPaint(
        painter: BorderPainter(gradient!, isSelected),
        child: Container(
          padding: EdgeInsets.all(padding),
          height: height,
          child: ShaderMask(
            shaderCallback: (bounds) => isSelected ? gradientShader! : LinearGradient(colors: [textColor, textColor]).createShader(bounds), // Apply gradient only if isSelected is true
            child: Text(
              tag,
              style: TextStyle(
                color: Colors.white, // This color will be covered by the gradient
                fontSize: fontSize,
                fontWeight: CustomFontWeight.B,
              ),
            ),
          ),
        ),
      ),
    );



  }
}
class BorderPainter extends CustomPainter {
  final Gradient gradient;
  final isSelected;

  BorderPainter(this.gradient, this.isSelected);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      // ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    if(this.isSelected){
      paint.shader = gradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    }else{
      paint.color = const Color(0xFF606060);
    }

    final path = Path()
      ..addRRect(RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height), Radius.circular(15.0)))
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}