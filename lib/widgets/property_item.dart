import 'package:flutter/material.dart';
import 'package:realestate_project/theme/color.dart';
import 'package:realestate_project/pages/details.dart';
import 'custom_image.dart';
import 'icon_box.dart';

class PropertyItem extends StatefulWidget {
  final Map<String, dynamic> data;
  final bool isPopular; // Add a field to determine if the item is popular
  final Function(Map<String, dynamic> itemData, bool isFavorited)
      onFavoriteToggle;

  const PropertyItem({
    super.key,
    required this.data,
    this.isPopular = false,
    required this.onFavoriteToggle, // Add onFavoriteToggle parameter
  });

  @override
  _PropertyItemState createState() => _PropertyItemState();
}

class _PropertyItemState extends State<PropertyItem>
    with SingleTickerProviderStateMixin {
  late bool isFavorited = true;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(propertyData: widget.data),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: 240,
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor.withOpacity(0.1),
              spreadRadius: .5,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Stack(
          children: [
            CustomImage(
              widget.data["image"],
              width: double.infinity,
              height: 150,
              radius: 25,
            ),
            // Conditionally show the favorite button for popular items
            if (widget.isPopular) ...[
              Positioned(
                right: 20,
                top: 130,
                child: _buildFavoriteButton(),
              ),
            ],
            Positioned(
              left: 15,
              top: 160,
              child: _buildInfo(),
            ),
          ],
        ),
      ),
    );
  }

  void _toggleFavorite() {
    setState(() {
      isFavorited = !isFavorited;
    });
    _controller.forward(from: 0.0);
    // Call the callback function to handle favorite toggling
    widget.onFavoriteToggle(widget.data, isFavorited);
  }

  Widget _buildFavoriteButton() {
    return GestureDetector(
      onTap: _toggleFavorite,
      child: Transform.scale(
        scale: _scaleAnimation.value,
        child: IconBox(
          bgColor: AppColor.red,
          child: Icon(
            isFavorited ? Icons.favorite : Icons.favorite_border,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.data["name"],
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            const Icon(
              Icons.place_outlined,
              color: AppColor.darker,
              size: 13,
            ),
            const SizedBox(
              width: 3,
            ),
            Text(
              widget.data["location"],
              style: const TextStyle(fontSize: 13, color: AppColor.darker),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          widget.data["price"],
          style: const TextStyle(
            fontSize: 15,
            color: AppColor.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
