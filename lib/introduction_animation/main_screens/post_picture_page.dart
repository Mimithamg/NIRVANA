import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'profile_page.dart';

class PostPicturePage extends StatefulWidget {
  @override
  _PostPicturePageState createState() => _PostPicturePageState();
}

class _PostPicturePageState extends State<PostPicturePage> {
  late File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  List<String> uploadedImageUrls = [];

  _PostPicturePageState() {
    _imageFile = null;
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await _picker.getImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }

  Future<void> _uploadImage() async {
    if (_imageFile != null) {
      final storageRef = FirebaseStorage.instance.ref().child('images');
      final uploadTask =
          storageRef.child('image_${DateTime.now()}.jpg').putFile(_imageFile!);

      try {
        // Wait for the upload task to complete
        final snapshot = await uploadTask;

        // Handle the upload task completion
        if (snapshot.state == TaskState.success) {
          // The upload was successful
          final downloadUrl = await snapshot.ref.getDownloadURL();

          // Handle the download URL (e.g., save it in your database or display it to the user)
          print('Image uploaded. Download URL: $downloadUrl');

          // Add the downloadUrl to the uploadedImageUrls list
          setState(() {
            uploadedImageUrls.add(downloadUrl);
          });

          // Navigate to the ProfilePage
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Post(imageUrls: uploadedImageUrls),
            ),
          );
        } else {
          // Handle the case where the upload task is not successful
          print('Image upload failed.');

          // Display an error message or perform any error handling
          // ...
        }
      } catch (e) {
        // Handle any errors that occurred during the upload
        print('Error during image upload: $e');

        // Display an error message or perform any error handling
        // ...
      }
    } else {
      // Handle the case where no image file is selected
      print('No image file selected.');

      // Display an error message or perform any error handling
      // ...
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Picture'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: _imageFile != null && _imageFile!.existsSync()
                ? Image.file(
                    _imageFile!,
                    width: 300,
                    height: 300,
                  )
                : Text('No image selected'),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => _pickImage(ImageSource.camera),
                child: Text('Take Picture'),
              ),
              ElevatedButton(
                onPressed: () => _pickImage(ImageSource.gallery),
                child: Text('Choose from Gallery'),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _imageFile != null ? _uploadImage : null,
            child: Text('Upload Picture'),
          ),
        ],
      ),
    );
  }
}

//import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  final List<String> imageUrls;

  Post({required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: ListView.builder(
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Image.network(imageUrls[index]);
        },
      ),
    );
  }
}
