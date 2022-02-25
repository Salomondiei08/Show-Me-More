import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/place.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../themes/app_colors.dart' as color;

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.place}) : super(key: key);

  final Place place;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: color.kcGrayColor,
      body: SafeArea(
        child: ClipRRect(

          child: Column(
            children: [
              const SizedBox(width: double.infinity),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(place.imageUrl),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: double.infinity,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 44.h, left: 10),
                        child: Text(
                          place.name,
                          style: TextStyle(
                              color: color.kcGoldColr,
                              fontSize: 21.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: color.kcGrayColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Addresse :',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Yaloussoukro',
                              style: TextStyle(
                                  color: color.kcGoldColr, fontSize: 20.sp),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Contact :',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            place.contact,
                            style: TextStyle(
                                color: color.kcGoldColr, fontSize: 20.sp),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          place.description,
                          style:  TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
