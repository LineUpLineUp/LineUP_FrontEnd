import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../screen/const/custom_font_weight.dart';

class CustomImagePicker extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CustomImagePicker();
}

class _CustomImagePicker extends State<CustomImagePicker> {
  File? _pikcedImage;

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);

    if (pickedImage != null) {
      setState(() {
        _pikcedImage = File(pickedImage.path);
      });
    }
  }

  void _removeImage() {
    setState(() {
      _pikcedImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _pikcedImage == null
        ? GestureDetector(
            onTap: () => _pickImage(ImageSource.gallery),
            child: Image.asset(
              'assets/icons/postForm/image_select.png',
              width: 64,
              height: 64,
            ),
          )
        : Row(
            children: [
              Image.file(
                _pikcedImage!,
                width: 64,
                height: 64,
              ),
              const SizedBox(width: 10),
              Container(
                height: 20,
                child: ElevatedButton(
                  onPressed: () => _pickImage(ImageSource.gallery),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: Text(
                    '수정',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: CustomFontWeight.L,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              if (_pikcedImage != null)
                Container(
                  height: 20,
                  child: ElevatedButton(
                    onPressed: _removeImage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    child: Text(
                      '삭제',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: CustomFontWeight.L,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
            ],
          );
  }
}
