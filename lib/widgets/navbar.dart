import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:provider/provider.dart';
import 'package:recipeapp_animation/constants/colors.dart';
import 'package:recipeapp_animation/providers/nav_provider.dart';
import 'package:recipeapp_animation/util/screen_util.dart';
// import 'package:recipeapp_animation/util/text_util.dart';
import 'package:recipeapp_animation/views/chefs.dart';
import 'package:recipeapp_animation/views/home_screen.dart';
import 'package:recipeapp_animation/views/recipe_level.dart';
import 'package:recipeapp_animation/views/saved_recipes.dart';

class MainNav extends StatelessWidget {
  const MainNav({super.key});

  static final List<Widget> _screens = [
    const HomeScreen(),
    const ChefsScreen(),
    const RecipeLevel(),
    const SavedRecipes(),
  ];

  @override
  Widget build(BuildContext context) {
    debugPrint("🏠 MainNav built");

    return Scaffold(
      body: Stack(
        children: [
          // Use Selector instead of Consumer for more granular control
          Selector<BottomNavProvider, int>(
            selector: (context, navProvider) => navProvider.selectedIndex,
            builder: (context, selectedIndex, child) {
              debugPrint("📱 IndexedStack rebuilt with index: $selectedIndex");
              return Positioned.fill(
                child: PopScope(
                  canPop: false,
                  onPopInvokedWithResult: (didPop, result) async {
                    if (!didPop) {
                      final navProvider = context.read<BottomNavProvider>();
                      if (navProvider.selectedIndex == 0) {
                        await SystemNavigator.pop();
                      } else {
                        navProvider.setIndex(0);
                      }
                    }
                  },
                  child: IndexedStack(
                    index: selectedIndex,
                    children: MainNav._screens,
                  ),
                ),
              );
            },
          ),

          // Static positioned navbar - should never rebuild
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _StaticBottomNavBar(),
          ),
        ],
      ),
    );
  }
}

// Separate static widget for navbar to prevent rebuilds
class _StaticBottomNavBar extends StatelessWidget {
  const _StaticBottomNavBar();

  @override
  Widget build(BuildContext context) {
    debugPrint("🔧 Static NavBar built (should only happen once)");

    return BottomNavBar(
      onItemTapped: (index) {
        context.read<BottomNavProvider>().setIndex(index);
      },
    );
  }
}

class BottomNavBar extends StatelessWidget {
  final ValueChanged<int> onItemTapped;

  BottomNavBar({super.key, required this.onItemTapped});
  final items = [
   const _NavBarItem(label: 'Home', iconPath: 'assets/icons/home.svg'),
  
    const _NavBarItem(
      label: 'Groups',
      iconPath: 'assets/icons/Tabbar Icons-1.svg',
    ),
    const _NavBarItem(
      label: 'Practices',
      iconPath: 'assets/icons/Tabbar Icons-2.svg',
    ),
       const _NavBarItem(
      label: 'Journal',
      iconPath: 'assets/icons/journalicon.svg',
    ),
    // const _NavBarItem(
    //   label: 'Resources',
    //   iconPath: 'assets/icons/Tabbar Icons-3.svg',
    // ),
  ];
  @override
  Widget build(BuildContext context) {
    debugPrint("Navbar rebuilt");
    final isLandscape = context.orientation == Orientation.landscape;

    final double iconSize = isLandscape
        ? context.width(0.045)
        : context.width(0.06);
    final double textSize = isLandscape
        ? context.responsiveFont(8)
        : context.responsiveFont(10);
    final double verticalPadding = isLandscape
        ? context.height(0.00)
        : context.height(0.0);
    final double containerPadding = isLandscape
        ? context.height(0.008)
        : context.height(0.007);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.width(0.04),
          vertical: 10,
        ),
        child: Container(
          height: isLandscape ? context.height(0.2) : context.height(0.08),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 0, 0, 0),
            borderRadius: BorderRadius.circular(54),
            boxShadow: [
              BoxShadow(
                color: textColor.withValues(alpha: 0.08),
                blurRadius: 16,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(items.length, (index) {
              return Expanded(
                child: _SmartNavBarItem(
                  item: items[index],
                  index: index,
                  onTap: () => onItemTapped(index),
                  iconSize: iconSize,
                  textSize: textSize,
                  verticalPadding: verticalPadding,
                  containerPadding: containerPadding,
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _SmartNavBarItem extends StatelessWidget {
  final _NavBarItem item;
  final int index;
  final VoidCallback onTap;
  final double iconSize;
  final double textSize;
  final double verticalPadding;
  final double containerPadding;

  const _SmartNavBarItem({
    required this.item,
    required this.index,
    required this.onTap,
    required this.iconSize,
    required this.textSize,
    required this.verticalPadding,
    required this.containerPadding,
  });

  @override
  Widget build(BuildContext context) {
    final isLandscape = context.orientation == Orientation.landscape;

    return GestureDetector(
      onTap: onTap,
      // SIRF YE SPECIFIC ITEM REBUILD HOGA
      child: Selector<BottomNavProvider, bool>(
        selector: (context, navProvider) => navProvider.selectedIndex == index,
        builder: (context, isSelected, child) {
          debugPrint("🔄 Item $index rebuilt - Selected: $isSelected");

          return isSelected
              ? Padding(
                  padding: EdgeInsets.all(containerPadding),
                  child: AnimatedContainer(
                    height: isLandscape
                        ? context.height(0.18)
                        : context.height(0.07),
                    duration: const Duration(milliseconds: 200),
                    padding: EdgeInsets.symmetric(
                      vertical: verticalPadding,
                      horizontal: 0,
                    ),
                    decoration: BoxDecoration(
                      // color: const Color.fromARGB(255, 224, 128, 2),
                      borderRadius: BorderRadius.circular(54),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _StaticIcon(
                          iconPath: item.iconPath,
                          color: whiteColor,
                          iconSize: iconSize,
                        ),
                        // _StaticText(
                        //   label: item.label,
                        //   color: whiteColor,
                        //   textSize: textSize,
                        // ),
                      ],
                    ),
                  ),
                )
              : AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: EdgeInsets.symmetric(
                    vertical: verticalPadding,
                    horizontal: 0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _StaticIcon(
                        iconPath: item.iconPath,
                        color: textfiledhintColor,
                        iconSize: iconSize,
                      ),
                      SizedBox(height: context.height(0.005)),
                      // _StaticText(
                      //   label: item.label,
                      //   color: textfiledhintColor,
                      //   textSize: textSize,
                      // ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}

class _StaticIcon extends StatelessWidget {
  final String iconPath;
  final Color color;
  final double iconSize;

  const _StaticIcon({
    required this.iconPath,
    required this.color,
    required this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconPath,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      width: iconSize,
      height: iconSize,
    );
  }
}

// class _StaticText extends StatelessWidget {
//   final String label;
//   final Color color;
//   final double textSize;

//   const _StaticText({
//     required this.label,
//     required this.color,
//     required this.textSize,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       label,
//       style: AppTextStyles.manropesemibold.copyWith(
//         fontSize: textSize,
//         fontWeight: FontWeight.w500,
//         color: color,
//       ),
//     );
//   }
// }

class _NavBarItem {
  final String label;
  final String iconPath;
  const _NavBarItem({required this.label, required this.iconPath});
}
