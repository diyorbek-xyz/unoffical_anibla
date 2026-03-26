import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/features/common/presentation/widgets/list.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

final items = [
  ListModel(label: "Lorem ipsum dolor", value: "Absde fghijklmnop qrstuvwx", icon: Icons.person_pin_sharp),
  ListModel(label: "Lorem ipsum dolor sit amet", value: "Absdefgh ijklmnopq", icon: Icons.person_pin_sharp),
  ListModel(label: "Lorem dolor sit amet", value: "Absd efghijklmn opqrs tuv", icon: Icons.person_pin_sharp),
  ListModel(label: "Lorem sit amet", value: "Absde fghij klmnop qrstuv wxyz", icon: Icons.person_pin_sharp),
  ListModel(label: "Lorem ipsum dolor sit amet", value: "Absdefgh ijklmnopq", icon: Icons.person_pin_sharp),
  ListModel(label: "Lorem sit amet", value: "Absde fghij klmnop qrstuv wxyz", icon: Icons.person_pin_sharp),
];

class ProfileSkeleton extends StatelessWidget {
  const ProfileSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      width: double.infinity,
      child: Column(spacing: 30, children: [basicInfo(context), menu()]),
    );
  }

  Row menu() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 50,
      children: [
        customTabs(),
        Expanded(flex: 7, child: ListsWidget(items: items)),
      ],
    );
  }

  SizedBox customTabs() {
    return SizedBox(
      width: 300,
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: 5,
        separatorBuilder: (context, index) => SizedBox(height: 2),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('tab'),
            shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(100)),
            onTap: () => {},
            tileColor: Colors.transparent,
            selected: false,
            selectedTileColor: context.appColors.primaryFixed.withValues(alpha: 0.1),
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 11),
            leading: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: context.appColors.onPrimary,
              ),
              padding: EdgeInsets.all(10),
              child: Icon(Icons.info, color: context.appColors.primary),
            ),
          );
        },
      ),
    );
  }

  Row basicInfo(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Skeleton.leaf(
          child: CircleAvatar(radius: 54, child: Text("A", style: TextStyle(fontSize: 42))),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 2,
          children: [
            Skeleton.leaf(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "Ism Familiya ", style: TextStyle(fontSize: 24)),
                    WidgetSpan(child: Icon(Icons.verified, color: context.appColors.onSurface)),
                  ],
                ),
              ),
            ),
            Skeleton.leaf(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                  children: [TextSpan(text: "Balans: 0.0 so'm")],
                ),
              ),
            ),
          ],
        ),
        Skeleton.ignore(child: Container()),
        Column(
          children: [
            Skeleton.leaf(
              child: IconButton(onPressed: () {}, icon: Icon(Icons.exit_to_app)),
            ),
          ],
        ),
      ],
    );
  }
}
