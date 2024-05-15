import 'package:flutter/material.dart';
import 'package:realestate_project/theme/color.dart';
import 'package:realestate_project/utils/data.dart';
import 'package:realestate_project/widgets/broker_item.dart';
import 'package:realestate_project/widgets/company_item.dart';
import 'package:realestate_project/widgets/custom_textbox.dart';
import 'package:realestate_project/widgets/recommend_item.dart';

import '../widgets/category_item.dart';
import '../widgets/custom_image.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  bool outlinedSelected = false;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: AppColor.appBgColor,
          pinned: true,
          snap: true,
          floating: true,
          title: _buildHeader(),
        ),
        SliverToBoxAdapter(child: _buildBody())
      ],
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Хайх",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.add_circle_outline,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    // Add your onPressed action here
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    // Add your onPressed action here
                  },
                ),
                CustomImage(
                  profile,
                  width: 45,
                  height: 45,
                  trBackground: true,
                  borderColor: AppColor.primary,
                  radius: 10,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          _buildSearch(),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(height: 1),
          _buildCategories(),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              "Обьектууд",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _buildRecommended(),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              "Брокер",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _buildCompanies(),
          const SizedBox(
            height: 20,
          ),
          _buildBrokers(),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          const Expanded(
            child: CustomTextBox(
              hint: "Хайх",
              prefix: Icon(Icons.search, color: Colors.grey),
            ),
          ),
          const SizedBox(width: 10),
          _buildFilterButton(),
        ],
      ),
    );
  }

  bool _showCategories = false;
  int _selectedCategory = 5;

  Widget _buildFilterButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _showCategories = !_showCategories;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          shape: const StadiumBorder(), // Use StadiumBorder for sharp corners
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        ),
        child: const Icon(Icons.filter_list_rounded),
      ),
    );
  }

  Widget _buildCategories() {
    if (!_showCategories) {
      return Container();
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(bottom: 5, left: 15),
      child: Row(
        children: List.generate(
          categories.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 1),
            child: CategoryItem(
              data: categories[index],
              selected: index == _selectedCategory,
              onTap: () {
                setState(() {
                  _selectedCategory = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  _buildRecommended() {
    List<Widget> lists = List.generate(
      recommended.length,
      (index) => RecommendItem(
        data: recommended[index],
      ),
    );

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(bottom: 5, left: 15),
      child: Row(children: lists),
    );
  }

  _buildCompanies() {
    List<Widget> lists = List.generate(
      companies.length,
      (index) => CompanyItem(
        data: companies[index],
        color: AppColor.listColors[index % 10],
        selected: index == _selectedCategory,
        onTap: () {
          setState(() {
            _selectedCategory = index;
          });
        },
      ),
    );

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(bottom: 5, left: 15),
      child: Row(children: lists),
    );
  }

  _buildBrokers() {
    List<Widget> lists = List.generate(
      brokers.length,
      (index) => BrokerItem(
        data: brokers[index],
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(children: lists),
    );
  }
}
