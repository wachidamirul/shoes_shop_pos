import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../../widgets/appbar/tab_bar.dart';
import '../../../widgets/texts/section_heading.dart';
import '../controllers/analytic_controller.dart';

class AnalyticView extends GetView<AnalyticController> {
  const AnalyticView({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                expandedHeight: 210,
                automaticallyImplyLeading: false,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: MySizes.defaultSpace,
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      // -- Total Sales Section
                      MySectionHeading(
                        title: "Total Sales",
                        showActionButton: true,
                        child: TextButton(
                          onPressed: () {
                            print("View All Sales");
                          },
                          child: Obx(
                            () => DropdownButton(
                              items:
                                  controller.timeFrameItem.map((String item) {
                                    return DropdownMenuItem(
                                      value: item,
                                      child: Text(item),
                                    );
                                  }).toList(),
                              onChanged: (newValue) {
                                controller.setTimeFrame(newValue);
                              },
                              value: controller.valTimeFrame.value,
                              underline: Container(),
                              focusColor: Colors.transparent,
                              dropdownColor:
                                  dark ? MyColors.black : MyColors.light,
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall?.copyWith(
                                fontSize: MySizes.fontSizeSm,
                                color: dark ? MyColors.white : MyColors.dark,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: MySizes.spaceBtwItems),

                      // -- Total Sales Data
                      Center(
                        child: Text(
                          "\$35.50",
                          style: Theme.of(context).textTheme.headlineLarge
                              ?.copyWith(color: MyColors.primary),
                        ),
                      ),
                    ],
                  ),
                ),

                // -- TabBar
                bottom: MyTabBar(
                  controller: controller.tabController,
                  tabs: [
                    Tab(
                      child: Text(
                        "Today",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "This Week",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    Tab(
                      child: Text(
                        "This Month",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "This Year",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: controller.tabController,
            children: [
              Center(
                child: Text(
                  "Daily Sales Data",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Center(
                child: Text(
                  "Weekly Sales Data",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Center(
                child: Text(
                  "Monthly Sales Data",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Center(
                child: Text(
                  "Yearly Sales Data",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
