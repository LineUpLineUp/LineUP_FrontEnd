import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker extends StatefulWidget {
  File? pickedImage;
  final Function(File?) onImageChanged; // 시작 시간 콜백 함수

  CustomImagePicker({
    Key? key,
    required this.pickedImage,
    required this.onImageChanged,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CustomImagePicker();

}

class _CustomImagePicker extends State<CustomImagePicker> {

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);

    if (pickedImage != null) {
      setState(() {
        widget.pickedImage = File(pickedImage.path);
      });
      widget.onImageChanged(widget.pickedImage);
    }
  }

  void _removeImage() {
    setState(() {
      widget.pickedImage = null;

    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.pickedImage == null
        ? GestureDetector(
            onTap: () => _pickImage(ImageSource.gallery),
            child: Image.asset(
              'assets/icons/postForm/image_select.png',
              width: 64,
              height: 64,
            ),
          )
        : Stack(
            children: [
              ClipRect(
                child: Container(
                  child: Image.file(
                    widget.pickedImage!,
                    width: 64,
                    height: 64,
                  ),
                ),
              ),
              Positioned(
                top: -15,
                right: -15,
                child: IconButton(
                  onPressed: _removeImage,
                  icon: Image.asset(
                    'assets/icons/postForm/deleteImage.png',
                  ),
                ),
              ),
            ],
          );
  }
}
