import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/features/anibla/data/models/misc/plan.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:flutter/material.dart';

class PlansMenu extends StatelessWidget {
  final List<Plan> plans;
  const PlansMenu(this.plans, {super.key});

  @override
  Widget build(BuildContext context) => GridView.builder(
    padding: .all(context.isMobile ? 10 : 0),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: context.isMobile ? 1 : 2,
      mainAxisExtent: 200,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
    ),
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: plans.length,
    itemBuilder: (context, index) {
      final pricePerM = (plans[index].price / plans[index].time);
      return Material(
        clipBehavior: .antiAlias,
        borderRadius: .circular(15),
        child: InkWell(
          onTap: () {},
          child: Ink(
            color: context.appColors.primaryContainer,
            padding: .all(10),
            child: Column(
              crossAxisAlignment: .center,
              mainAxisAlignment: .center,
              spacing: 3,
              children: [
                Text(
                  "${plans[index].title.uz} - ${plans[index].price} so'm",
                  style: TextStyle(
                    color: context.appColors.onPrimaryContainer,
                    fontSize: context.textTheme.headlineMedium!.fontSize,
                  ),
                ),
                Text(
                  "Muddat: ${DateTime.now().add(Duration(days: (plans[index].time * 30.5).floor())).formatFull()} gacha",
                  style: TextStyle(
                    color: context.appColors.onPrimaryContainer.withAlpha(200),
                    fontSize: context.textTheme.titleMedium!.fontSize,
                  ),
                ),
                Text(
                  "Oyiga: ${(pricePerM.isFinite ? pricePerM : 0).ceil()} so'm",
                  style: TextStyle(
                    color: context.appColors.onPrimaryContainer.withAlpha(200),
                    fontSize: context.textTheme.titleMedium!.fontSize,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
