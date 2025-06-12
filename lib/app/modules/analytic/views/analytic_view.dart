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
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
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
                          child: Obx(
                            () => Text(
                              "\$${controller.totalSales.value.toStringAsFixed(2)}",
                              style: Theme.of(context).textTheme.headlineLarge
                                  ?.copyWith(color: MyColors.primary),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // -- TabBar
                bottom: MyTabBar(
                  controller: controller.tabController,
                  tabs:
                      controller.timeFrameItem
                          .map(
                            (label) => Tab(
                              child: Text(
                                label,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: controller.tabController,
            children: List.generate(4, (index) {
              return Obx(() {
                final products = controller.productsSold;
                if (products.isEmpty) {
                  return Center(child: Text("No products sold."));
                }
                return ListView.builder(
                  padding: const EdgeInsets.all(MySizes.md),
                  itemCount: products.length,
                  itemBuilder: (_, i) {
                    final product = products[i];
                    return ListTile(
                      leading:
                          product['image_url'] != null &&
                                  product['image_url'] != ''
                              ? Image.network(
                                product['image_url'],
                                width: 48,
                                height: 48,
                                fit: BoxFit.cover,
                              )
                              : Container(
                                width: 48,
                                height: 48,
                                color: Colors.grey[300],
                                child: Icon(Icons.image_not_supported),
                              ),
                      title: Text(product['product_name'] ?? 'Unknown'),
                      trailing: Text(
                        'Qty: ${product['quantity'] ?? 0}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                );
              });
            }),
          ),
        ),
      ),
    );
  }
}
