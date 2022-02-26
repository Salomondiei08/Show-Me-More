import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import '../providers/places_provider.dart';
import '../themes/app_colors.dart' as color;
import 'package:responsive_sizer/responsive_sizer.dart';

import 'dart:math' show Random;
import '../widgets/bottom_widget.dart';

class ArView extends StatefulWidget {
  const ArView({Key? key}) : super(key: key);

  @override
  State<ArView> createState() => _ArViewState();
}

final random = Random();

int number = random.nextInt(2);

class _ArViewState extends State<ArView> {
  bool isPlaceNotFound = true;

  late ArCoreController arCoreController;

  Map<int, ArCoreAugmentedImage> imagesMap = {};

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {

    print(number);

    final place = Provider.of<Places>(context).placeList;
    return Scaffold(
      body: Stack(
        children: [
          //  _buildQrView(context),
          ArCoreView(
            onArCoreViewCreated: onArCoreViewCreated,
            type: ArCoreViewType.AUGMENTEDIMAGES,
          ),
          Center(
            child: Container(
              height: 50.h,
              width: 80.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: color.kcGreenColor,
                    width: 6,
                    style: BorderStyle.solid),
              ),
            ),
          ),
          isPlaceNotFound
              ? Positioned(
                  bottom: 9.h,
                  left: 35.w,
                  child: Container(
                    child: const Icon(Icons.search),
                    height: 8.h,
                    width: 35.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                )
              : Positioned(
                  bottom: 9.h,
                  left: 10.w,
                  child: BottomWidget(
                    name: place[number].name,
                    imageUrl: place[number].imageUrl,
                    description: place[number].description,
                    contact: place[number].websiteUrl,
                  ),
                ),
        ],
      ),
    );
  }

  void onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    arCoreController.onTrackingImage = controlTrackingImages;

    // Load the image
    laodImage();
  }

  void controlTrackingImages(ArCoreAugmentedImage arImage) {

    if (!imagesMap.containsKey(arImage.index)) {
      imagesMap[arImage.index] = arImage;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Image Detected"),
        ),
      );


      addImage(arImage);

      //      setState(() {
      //   isPlaceNotFound = true;
      // });
    }
  }

  void laodImage() async {
    final ByteData bytes = await rootBundle.load("assets/qrcode.png");
    arCoreController.loadSingleAugmentedImage(
        bytes: bytes.buffer.asUint8List());
  }

  Future addImage(ArCoreAugmentedImage arImage) async {
    final bytes =
        (await rootBundle.load("assets/inp-ar1.png")).buffer.asUint8List();

    final placeImages = ArCoreNode(
      image: ArCoreImage(bytes: bytes, width: 600, height: 600),
      position: arImage.centerPose.translation,
      rotation:
          arImage.centerPose.rotation + vector.Vector4(-1.0, 0.0, 0.0, 0.0),
    );

    arCoreController.addArCoreNodeToAugmentedImage(placeImages, arImage.index);
  }

  Future addShpere(ArCoreAugmentedImage arImage) async {
    final ByteData textureBytes = await rootBundle.load("assets/inp-ar1.png");

    final material = ArCoreMaterial(
      color: Colors.transparent,
      textureBytes: textureBytes.buffer.asUint8List(),
    );

    final sphere = ArCoreSphere(
      materials: [material],
      radius: arImage.extentX / 2,
    );

    final node = ArCoreNode(
      shape: sphere,
      position: arImage.centerPose.translation,
    );

    arCoreController.addArCoreNodeToAugmentedImage(node, arImage.index);
  }

  @override
  void dispose() {
    super.dispose();
    arCoreController.dispose();
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }
}
