import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomWidget extends StatelessWidget {


  final String imageUrl;
  final String name;
  final String description;
  final String contact;

 const  BottomWidget({required this.imageUrl, required this.name, required this.description, required this.contact});

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
              const  BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset.zero,
                ),
              ],
            ),
            child: Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipOval(
                      child: Image.network(
                        imageUrl,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Positioned(
                      bottom: 0,
                      right: 0,
                      child: Icon(
                        Icons.circle,
                        size: 20,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
               const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      Text(description),
                      Text(
                        contact,
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.location_pin,
                  color: Colors.red,
                  size: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}