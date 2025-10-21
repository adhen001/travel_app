import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home"), centerTitle: true),
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg1.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Overlay gelap supaya teks terbaca
          Container(color: Colors.black.withOpacity(0.3)),

          // Konten utama
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Halo, Muhamad Soleh!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "NIM: 232101263",
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                const SizedBox(height: 12),

                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "assets/images/bali.jpeg",
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),

                TextField(
                  decoration: InputDecoration(
                    hintText: "Cari destinasi, hotel, atau aktivitas...",
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildBookingButton(Icons.hotel, "Hotel"),
                    _buildBookingButton(Icons.flight, "Pesawat"),
                    _buildBookingButton(Icons.hiking, "Kegiatan"),
                    _buildBookingButton(Icons.directions_bus, "Bus"),
                    _buildBookingButton(Icons.train, "Kereta"),
                  ],
                ),
                const SizedBox(height: 24),

                const Text(
                  "Ulasan Destinasi Populer",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),

                _buildReviewCard(
                  imagePath: "assets/images/bali.jpeg",
                  title: "Pantai Bali",
                  rating: 4.8,
                  review:
                      "Tempat yang menenangkan, cocok untuk liburan keluarga!",
                ),
                _buildReviewCard(
                  imagePath: "assets/images/bromo.jpeg",
                  title: "Gunung Bromo",
                  rating: 4.7,
                  review: "Sunrise terbaik seumur hidup!",
                ),
                _buildReviewCard(
                  imagePath: "assets/images/jogja.jpeg",
                  title: "Candi Prambanan",
                  rating: 4.6,
                  review: "Wisata sejarah yang memukau dan penuh budaya.",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookingButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.8),
          ),
          child: Icon(icon, size: 28, color: Colors.blue),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }

  Widget _buildReviewCard({
    required String imagePath,
    required String title,
    required double rating,
    required String review,
  }) {
    return Card(
      color: Colors.white.withOpacity(0.9),
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Image.asset(
              imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      Text(" $rating"),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(review, maxLines: 2, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
