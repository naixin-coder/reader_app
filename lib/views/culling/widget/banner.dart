/*
 * @Author: 刘林
 * @Date: 2021-10-14 17:05:02
 * @LastEditors: 刘林
 * @LastEditTime: 2021-10-18 10:48:04
 */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

// class BannerImages {
//   static const String banner1 =
//       "https://picjumbo.com/wp-content/uploads/the-golden-gate-bridge-sunset-1080x720.jpg";
//   static const String banner2 =
//       "https://cdn.mos.cms.futurecdn.net/Nxz3xSGwyGMaziCwiAC5WW-1024-80.jpg";
//   static const String banner3 = "https://wallpaperaccess.com/full/19921.jpg";
//   static const String banner4 =
//       "https://images.pexels.com/photos/2635817/pexels-photo-2635817.jpeg?auto=compress&crop=focalpoint&cs=tinysrgb&fit=crop&fp-y=0.6&h=500&sharp=20&w=1400";
// }

class BannerWidget extends StatefulWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  List<String> images = [
    'https://picjumbo.com/wp-content/uploads/the-golden-gate-bridge-sunset-1080x720.jpg',
    'https://cdn.mos.cms.futurecdn.net/Nxz3xSGwyGMaziCwiAC5WW-1024-80.jpg',
    'https://wallpaperaccess.com/full/19921.jpg',
    'https://images.pexels.com/photos/2635817/pexels-photo-2635817.jpeg?auto=compress&crop=focalpoint&cs=tinysrgb&fit=crop&fp-y=0.6&h=500&sharp=20&w=1400'
  ];

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
    //   startTimer();
    // });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 150,
        maxWidth: MediaQuery.of(context).size.width,
      ),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xFFF2F2F2),
            blurRadius: 7.0,
            spreadRadius: 7.0,
          )
        ],
      ),
      child: Swiper(
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: CachedNetworkImage(
                imageUrl: images[index],
                fit: BoxFit.fill,
              ),
            ),
          );
        },
        autoplay: true,
      ),
    );
  }
}
