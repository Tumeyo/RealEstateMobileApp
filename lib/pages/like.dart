import 'package:flutter/material.dart';

import '../theme/color.dart';
import '../utils/data.dart';
import '../widgets/custom_image.dart';

class LikePage extends StatefulWidget {
  final List<Map<String, dynamic>> favoriteItems; // Receive favoriteItems

  const LikePage({super.key, required this.favoriteItems});

  @override
  _LikePageState createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
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
                  "Хадгалсан",
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

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          for (final item in widget.favoriteItems) ...[
            ListTile(
              leading: CustomImage(
                item["image"],
                // Assuming "image" is the key for the image URL in your item data
                width: 50,
                height: 50,
              ),
              title: Text(item["name"]),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item["description"]),
                  const SizedBox(height: 5),
                  Text(item["location"]),
                  const SizedBox(height: 5),
                  Text(item["price"]),
                  // Add more fields as needed
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
