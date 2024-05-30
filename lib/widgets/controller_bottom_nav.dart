// ignore_for_file: deprecated_member_use_from_same_package

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tzkt/assets/assets.gen.dart';
import 'package:tzkt/utils/utils.dart';

// import '../utils/utils.dart';

const black = Colors.black;
const white = Color(0xffFFFFFF);
const kLime600 = Color(0xFF5EC000);
const kNeutral600 = Color(0xFF9F897A);
const kDivider = Color(0xFFE3E5E6);

class BottomNav extends HookConsumerWidget {
  const BottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = 0;

    final pages = <ControllerPage>[
      ControllerPage(
        page: Container(
          key: const PageStorageKey<String>('ic_explore'),
        ),
        img: TzktAssets.images.svg.explore,
        name: 'Explore',
      ),
      ControllerPage(
        page: Container(
          key: const PageStorageKey<String>('ic_portfolio'),
        ),
        img: TzktAssets.images.svg.portfolio,
        name: 'Portfolio',
      ),
      ControllerPage(
        page: Container(
          key: const PageStorageKey<String>('ic_earn'),
        ),
        img: TzktAssets.images.svg.earn,
        name: 'Earn',
      ),
      ControllerPage(
        page: Container(
          key: const PageStorageKey<String>('ic_spend'),
        ),
        img: TzktAssets.images.svg.spend,
        name: 'Spend',
      ),
      ControllerPage(
        page: Container(
          key: const PageStorageKey<String>('ic_connect'),
        ),
        img: TzktAssets.images.svg.connect,
        name: 'Connect',
      ),
    ];

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: context.screenHeight(.08),
        decoration: BoxDecoration(
          color: white,
          border: const Border(
            top: BorderSide(
              color: kDivider,
              width: 2,
              
            ),
          ),
        ),
        child: ClipRRect(
          child: BottomNavigationBar(
            elevation: 0,
            currentIndex: currentIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              // ref.read(controllerVM).onPageChanged(index);
            },
            selectedItemColor: kLime600,
            backgroundColor: Colors.transparent,
            enableFeedback: false,
            showUnselectedLabels: true,
            useLegacyColorScheme: false,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w700,
              color: black,
              fontSize: 12,
              height: 2,
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w700,
              color: kNeutral600,
              fontSize: 12,
              // height: 2,
            ),
            items: [
              for (final page in pages.indexed)
                BottomNavigationBarItem(
                  label: page.$2.name,
                  tooltip: page.$2.name,
                  icon: Stack(
                    children: [
                      ...switch (page.$1) {
                        0 => [
                            page.$2.img.svg(
                              height: 20,
                              color: page.$1 == currentIndex ? black : null,
                            )
                          ],
                        1 => [
                            page.$2.img.svg(
                              height: 20,
                              color: page.$1 == currentIndex ? black : null,
                            )
                          ],
                        2 => [
                            page.$2.img.svg(
                              height: 20,
                              color: page.$1 == currentIndex ? black : null,
                            )
                          ],
                        3 => [
                            SizedBox(
                              height: 18,
                              width: 20,
                              child: page.$2.img.svg(
                                height: 20,
                                // width: 20,
                                color: page.$1 == currentIndex ? black : null,
                              ),
                            )
                          ],
                        _ => [
                            page.$2.img.svg(
                              height: 20,
                              color: page.$1 == currentIndex ? black : null,
                            )
                          ],
                      }
                    ],
                  ),
                )
            ],
          ).nudge(y: 7),
        ),
      ),
    );
  }
}

class ControllerPage {
  const ControllerPage({
    required this.page,
    required this.img,
    required this.name,
  });

  final Widget page;
  final String name;
  final SvgGenImage img;
}
