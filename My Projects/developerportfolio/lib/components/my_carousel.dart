// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyCarousel extends StatelessWidget {
  const MyCarousel({
    Key? key,
    required this.items,
  }) : super(key: key);
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: items.length,
      itemBuilder: (context, index, realIndex) {
        return GestureDetector(
          onTap: () {
            final url = Uri.parse(items[index]);
              canLaunchUrl(url).then((canLaunch) {
                if (canLaunch) {
                  launchUrl(
                    url,
                    mode: LaunchMode.externalApplication,
                  );
                } else {
                  //showError('Unable to Launch Web Browser');
                  log('Unable to Launch Web Browser');
                }
            });
          },
          child: AspectRatio(
            aspectRatio: 9 / 1,
            child: ClipRRect(borderRadius: BorderRadius.circular(15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.outline.withOpacity(0.20),
                  /* image: DecorationImage(
                    image: AssetImage(
                      'assets/logos/logo.png',
                    ),
                    fit: BoxFit.cover
                  ) */
                ),
                child: CachedNetworkImage(
                  imageUrl: items[index],
                  fit: BoxFit.fill,
                ),
              )
            ),
          )
        );
      },
      options: CarouselOptions(
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(
          milliseconds: 1200,
        ),
        enlargeCenterPage: true,
      ),
    );
  }
}