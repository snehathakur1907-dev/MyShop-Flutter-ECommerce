
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BannerCarousel extends StatelessWidget {
  const BannerCarousel({super.key});

  static const List<Map<String, dynamic>> banners = [
    {
      'title': 'MEGA SALE',
      'subtitle': 'Discover your favourites',
      'discount': 'UP TO 40% OFF',
      'color': Color(0xFF243B80),
      'image':
      'https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=1000',
    },
    {
      'title': 'NEW ARRIVALS',
      'subtitle': 'Fresh styles for you',
      'discount': 'SHOP THE LATEST',
      'color': Color(0xFF8A4667),
      'image':
      'https://images.unsplash.com/photo-1483985988355-763728e1935b?w=1000',
    },
    {
      'title': 'TECH DEALS',
      'subtitle': 'Upgrade your everyday',
      'discount': 'SPECIAL OFFERS',
      'color': Color(0xFF176B70),
      'image':
      'https://images.unsplash.com/photo-1498049794561-7780e7231661?w=1000',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: banners.length,
      options: CarouselOptions(
        height: 175,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.91,
        autoPlayInterval: const Duration(seconds: 4),
      ),
      itemBuilder: (context, index, realIndex) {
        final banner = banners[index];

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: banner['color'] as Color,
            borderRadius: BorderRadius.circular(22),
            image: DecorationImage(
              image: NetworkImage(banner['image'] as String),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                (banner['color'] as Color).withValues(alpha: 0.68),
                BlendMode.darken,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  banner['title'] as String,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  banner['subtitle'] as String,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    banner['discount'] as String,
                    style: const TextStyle(
                      color: Color(0xFF243B80),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
