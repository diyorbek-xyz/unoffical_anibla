import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/core/utils/extensions.dart';
import 'package:application/features/profile/presentation/controller/profile_controller.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

class PlansMenu extends StatelessWidget {
  const PlansMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<ProfileController>();
    return SignalBuilder(
      builder: (context) {
        final state = controller.plansSignal.value;
        final data = state.isLoading ? controller.fakePlans : state.value ?? [];
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2.5, mainAxisSpacing: 5, crossAxisSpacing: 5),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (context, index) {
            final pricePerM = (data[index].price / data[index].time);
            return Material(
              clipBehavior: .antiAlias,
              borderRadius: .circular(15),
              child: InkWell(
                onTap: () {},
                child: Ink(
                  color: context.appColors.primaryContainer,
                  padding: .all(20),
                  child: Column(
                    crossAxisAlignment: .start,
                    mainAxisAlignment: .center,
                    spacing: 3,
                    children: [
                      Text(
                        "${data[index].title.uz} - ${data[index].price} so'm",
                        style: TextStyle(color: context.appColors.onPrimaryContainer, fontSize: context.textTheme.headlineMedium!.fontSize),
                      ),
                      Text(
                        "Muddat: ${DateTime.now().add(Duration(days: (data[index].time * 30.5).floor())).formatFull()} gacha",
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
                      Expanded(child: SizedBox.shrink()),
                      Align(
                        alignment: .bottomEnd,
                        child: FilledButton(onPressed: () {}, child: Text('Obuna bo\'lish')),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
