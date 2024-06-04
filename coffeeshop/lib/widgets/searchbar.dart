import 'package:coffeeshop/utils/app_colors.dart';
import 'package:flutter/material.dart';

class itemstab extends StatefulWidget {
  const itemstab({Key? key}) : super(key: key);

  @override
  State<itemstab> createState() => _itemstabState();
}

class _itemstabState extends State<itemstab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TabBar(
            labelColor: AppColors.primarycolor,
            unselectedLabelColor: AppColors.secondarycolor.withOpacity(0.5),
            controller: _tabController,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 3,
                color: AppColors.primarycolor,
              ),
            ),
            labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            labelPadding: EdgeInsets.symmetric(horizontal: 20),
            dividerColor: Color(0xFF212325),
            tabs: [
              Tab(text: "Hot Coffee"),
              Tab(text: "Cold Coffee"),
              Tab(text: "Cappuccino"),
            ],
          ),
        ),
      ],
    );
  }
}
