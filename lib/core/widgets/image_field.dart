import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onFilePicked});
  final ValueChanged<File?> onFilePicked;

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  File? selectedImage;
  bool isLoading = false;

  Future<void> pickImage() async {
    setState(() => isLoading = true);

    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() => selectedImage = File(image.path));
    }

    setState(() => isLoading = false);
    widget.onFilePicked(selectedImage);
  }

  void removeImage() {
    widget.onFilePicked(null);
    setState(() => selectedImage = null);
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: pickImage,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey),
              ),
              child: selectedImage != null
                  ? ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.file(selectedImage!, fit: BoxFit.cover),
              )
                  : const Icon(Icons.image_outlined, size: 140),
            ),
            if (selectedImage != null)
              Positioned(
                left: 8,
                top: 8,
                child: GestureDetector(
                  onTap: removeImage,
                  behavior: HitTestBehavior.opaque, // ← blocks parent tap
                  child: const Icon(Icons.close, color: Colors.red, size: 24),
                ),
              ),
          ],
        ),
      ),
    );
  }
}