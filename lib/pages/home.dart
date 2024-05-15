import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:realestate_project/pages/chat.dart';
import 'package:realestate_project/pages/explore.dart';
import 'package:realestate_project/pages/full_list_screen.dart';
import 'package:realestate_project/pages/like.dart';
import 'package:realestate_project/pages/settings.dart';
import 'package:realestate_project/theme/color.dart';
import 'package:realestate_project/utils/data.dart';
import 'package:realestate_project/widgets/bottombar_item.dart';
import 'package:realestate_project/widgets/category_item.dart';
import 'package:realestate_project/widgets/custom_image.dart';
import 'package:realestate_project/widgets/custom_textbox.dart';
import 'package:realestate_project/widgets/property_item.dart';
import 'package:realestate_project/widgets/recent_item.dart';
import 'package:realestate_project/widgets/recommend_item.dart';

import 'Notification.dart';

// Define a function to convert dynamic items to a map list
List<Map<String, dynamic>> convertToMapList(List<dynamic> items) {
  return items.map((item) => item as Map<String, dynamic>).toList();
}

// Define the HomePage widget
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Define and initialize the favoriteItems list
  List<Map<String, dynamic>> favoriteItems = [];

  bool outlinedSelected = false;
  bool standardSelected = false;
  bool filledSelected = false;
  bool tonalSelected = false;

  // Function to toggle favorite status
  void toggleFavorite(Map<String, dynamic> itemData, bool isFavorited) {
    setState(() {
      if (isFavorited) {
        // Add item to favorites
        favoriteItems.add(itemData);
      } else {
        // Remove item from favorites
        favoriteItems.remove(itemData);
      }
    });
  }

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

  // Build the header UI
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
                  "Сайн байна уу!",
                  style: TextStyle(
                    color: AppColor.darker,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Түмэндэлгэр",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
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
                    // Navigate to the Notification page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationPage(),
                      ),
                    );
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

  // Build the body UI
  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          _buildSearch(),
          const SizedBox(height: 20),
          _buildCategories(),
          const SizedBox(height: 1),
          _buildSection("Онцлох", () {
            _navigateToFullListScreen('Онцлох', populars);
          }),
          const SizedBox(height: 20),
          _buildPopulars(),
          const SizedBox(height: 20),
          _buildSection("Санал болгох", () {
            _navigateToFullListScreen('Санал болгох', recommended);
          }),
          const SizedBox(height: 20),
          _buildRecommended(),
          const SizedBox(height: 20),
          _buildSection("Үзсэн", () {
            _navigateToFullListScreen('Үзсэн', recents);
          }),
          const SizedBox(height: 20),
          _buildRecent(),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  // Navigate to full list screen
  _navigateToFullListScreen(String title, List<dynamic> items) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullListScreen(
          allItems: convertToMapList(items),
          title: title,
        ),
      ),
    );
  }

  // Build a section with title and onTap callback
  Widget _buildSection(String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          GestureDetector(
            onTap: onTap,
            child: const Text(
              "Цааш",
              style: TextStyle(fontSize: 14, color: AppColor.darker),
            ),
          ),
        ],
      ),
    );
  }

  // Build the search UI
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

  // Build the filter button UI
  Widget _buildFilterButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            // Toggle the visibility of categories
            _showCategories = !_showCategories;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        ),
        child: const Icon(Icons.filter_list_rounded),
      ),
    );
  }

  bool _showCategories = false;
  int _selectedCategory = 5;

  // Build the categories UI
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

  // Build the popular items UI
  Widget _buildPopulars() {
    List<Map<String, dynamic>> popularsMapList = convertToMapList(populars);

    return CarouselSlider(
      options: CarouselOptions(
        height: 240,
        enlargeCenterPage: true,
        disableCenter: true,
        viewportFraction: 0.8,
      ),
      items: List.generate(
        popularsMapList.length,
        (index) => PropertyItem(
          data: popularsMapList[index],
          isPopular: true,
          onFavoriteToggle: (itemData, isFavorited) {
            // Call toggleFavorite function to handle favorite toggling
            toggleFavorite(itemData, isFavorited);
          },
        ),
      ),
    );
  }

  // Build the recommended items UI
  Widget _buildRecommended() {
    List<Map<String, dynamic>> recommendedMapList =
        convertToMapList(recommended);

    List<Widget> lists = List.generate(
      recommendedMapList.length,
      (index) => RecommendItem(
        data: recommendedMapList[index],
      ),
    );

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(bottom: 10, left: 15),
      child: Row(children: lists),
    );
  }

  // Build the recent items UI
  Widget _buildRecent() {
    List<Map<String, dynamic>> recentsMapList = convertToMapList(recents);

    List<Widget> lists = List.generate(
      recentsMapList.length,
      (index) => RecentItem(
        data: recentsMapList[index],
      ),
    );

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(bottom: 10, left: 15),
      child: Row(children: lists),
    );
  }
}

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int _activeTab = 0;
  late List<Map<String, dynamic>> favoriteItems =
      []; // Initialize favoriteItems

  late List<Map<String, dynamic>> _barItems; // Declare _barItems

  @override
  void initState() {
    super.initState();
    _barItems = [
      {
        "icon": Icons.home_outlined,
        "active_icon": Icons.home_rounded,
        "pageBuilder": () => const HomePage(),
      },
      {
        "icon": Icons.search_outlined,
        "active_icon": Icons.search,
        "pageBuilder": () => const ExplorePage(),
      },
      {
        "icon": Icons.favorite_border,
        "active_icon": Icons.favorite_outlined,
        "pageBuilder": () => LikePage(favoriteItems: favoriteItems),
      },
      {
        "icon": Icons.forum_outlined,
        "active_icon": Icons.forum_rounded,
        "pageBuilder": () => const ChatPage(),
      },
      {
        "icon": Icons.settings_outlined,
        "active_icon": Icons.settings_rounded,
        "pageBuilder": () => const SettingsPage(),
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPage(),
      floatingActionButton: _buildBottomBar(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  Widget _buildPage() {
    return Material(
      // Add Material widget here
      child: IndexedStack(
        index: _activeTab,
        children: List.generate(
          _barItems.length,
          (index) => _barItems[index]["pageBuilder"](),
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      height: 55,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 1,
            spreadRadius: 1,
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(
          _barItems.length,
          (index) => BottomBarItem(
            _activeTab == index
                ? _barItems[index]["active_icon"]
                : _barItems[index]["icon"],
            isActive: _activeTab == index,
            activeColor: Colors.blue,
            onTap: () {
              setState(() {
                _activeTab = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
