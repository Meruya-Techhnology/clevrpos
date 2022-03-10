import 'dart:io';

import 'package:flutter/material.dart';

class ImagePickerButton extends StatelessWidget {
  final String? imagePath;
  final double height;
  final double width;
  final double borderRadius;
  final Color? buttonColor;
  final Icon? icon;
  final VoidCallback? onTap;

  const ImagePickerButton({
    this.imagePath,
    this.height = 100,
    this.width = 100,
    this.borderRadius = 8,
    this.buttonColor,
    this.icon,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (imagePath != null) ? imageButton(context) : iconButton(context);
  }

  Widget iconButton(BuildContext context) {
    return Material(
      color: buttonColor ?? Colors.grey[100],
      borderRadius: BorderRadius.circular(
        borderRadius,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(
          borderRadius,
        ),
        child: Container(
          width: width,
          height: height,
          child: icon ??
              Icon(
                Icons.camera_alt,
              ),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              borderRadius,
            ),
          ),
        ),
      ),
    );
  }

  Widget imageButton(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          borderRadius,
        ),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Image.file(
              File(imagePath!),
              fit: BoxFit.cover,
              width: width,
              height: height,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
