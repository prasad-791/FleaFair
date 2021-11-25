import 'dart:io';

import 'package:flea_fair/configurations/config.dart';
import 'package:flea_fair/screens/widgets/text_field_label.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  late List<XFile>? images = [];
  final ImagePicker _picker = ImagePicker();

  void pickImagesGallery() async {
    final List<XFile>? result = await _picker.pickMultiImage();
    if (result != null) {
      setState(() {
        result.forEach((element) {
          images!.add(element);
        });
      });
    }
  }

  void pickImagesCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        images!.add(image);
      });
    }
  }

  Widget buildImagePickerButton(String val, IconData data, var width) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: primaryBlueLight,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            data,
            color: Colors.white,
          ),
          SizedBox(
            width: width * 0.02,
          ),
          Text(
            val,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: fontBold,
            ),
          )
        ],
      ),
    );
  }

  Widget buildPreviewImage(var height, var width, String path) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            height: height * 0.18,
            width: width * 0.4,
            decoration: BoxDecoration(
              color: Colors.green,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: Image.file(File(path)).image,
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                images!.removeWhere((element) => element.path == path);
              });
            },
            child: Container(
              margin: EdgeInsets.only(top: 5,right: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: primaryBlueLight,
              ),
              child: Icon(
                Icons.close,
                size: 20,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> previewImages(var height, var width) {
    return images!
        .map((e) => buildPreviewImage(height, width, e.path))
        .toList();
  }

  Widget buildPreviewContainer(var height, var width) {
    if (images == null || images!.length==0) {
      return SizedBox(
        height: height * 0,
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Preview of Selected Images',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: fontSemiBold,
          ),
        ),
        SizedBox(
          height: height * 0.03,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: previewImages(height, width),
          ),
        ),
      ],
    );
  }

  Widget buildAddProductButton() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 100, vertical: 7),
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: primaryBlueLight,
      ),
      child: Center(
        child: Text(
          'Add Product',
          style: TextStyle(
              color: Colors.white, fontFamily: fontBold, fontSize: 16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, left: 30),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Add your own product!',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: fontExtraBold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: TextFieldLabel(
                  prefixIcon: null,
                  label: 'Product Name',
                  hint: '',
                  maxLines: 1,
                  errorText: 'Empty Name',
                  accent: primaryBlue,
                  inputType: TextInputType.text,
                  obscure: false,
                  onSaved: (name) {}),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: TextFieldLabel(
                  prefixIcon: null,
                  label: 'Product Description',
                  hint: '',
                  maxLines: 5,
                  errorText: 'Empty description',
                  accent: primaryBlue,
                  inputType: TextInputType.text,
                  obscure: false,
                  onSaved: (description) {}),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: TextFieldLabel(
                  prefixIcon: null,
                  label: 'Product Price',
                  hint: '',
                  maxLines: 1,
                  errorText: 'Empty price',
                  accent: primaryBlue,
                  inputType: TextInputType.number,
                  obscure: false,
                  onSaved: (price) {}),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: TextFieldLabel(
                  prefixIcon: null,
                  label: 'Product Quantity',
                  hint: '',
                  maxLines: 1,
                  errorText: 'Empty quantity',
                  accent: primaryBlue,
                  inputType: TextInputType.number,
                  obscure: false,
                  onSaved: (quantity) {}),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Camera
                  GestureDetector(
                      onTap: () {
                        pickImagesCamera();
                      },
                      child: buildImagePickerButton(
                          'Camera', Icons.camera, width)),
                  // Gallery
                  GestureDetector(
                      onTap: () {
                        pickImagesGallery();
                      },
                      child: buildImagePickerButton(
                          'Gallery', Icons.image, width)),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            buildPreviewContainer(height, width),
            SizedBox(
              height: height * 0.03,
            ),
            // ADD PRODUCT BUTTON
            GestureDetector(
              onTap: () {},
              child: buildAddProductButton(),
            ),
            SizedBox(
              height: height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
