import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobileuts/model/food_model.dart';
import 'package:mobileuts/pages/food_detile_page.dart';
// import '../models/food_model.dart';
import '../services/food_service.dart';
// import 'food_detail_page.dart';

class FoodListPage extends StatefulWidget {
  const FoodListPage({super.key});

  @override
  State<FoodListPage> createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  List<Food> foods = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final data = await FoodService.loadFoods();
    setState(() {
      foods = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Makanan", style: GoogleFonts.poppins()),
        backgroundColor: Colors.orange,
      ),
      body: foods.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: foods.length,
              itemBuilder: (context, index) {
                final food = foods[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3,
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        food.image,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(food.name, style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodDetailPage(food: food),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
