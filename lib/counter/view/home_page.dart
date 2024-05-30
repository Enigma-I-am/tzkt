import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intersperse/intersperse.dart';

import 'package:tzkt/assets/assets.gen.dart';
import 'package:tzkt/core/services/navigation.service.dart';
import 'package:tzkt/counter/counter.dart';
import 'package:tzkt/counter/view/transactions_page.dart';
import 'package:tzkt/utils/extenstions.dart';
import 'package:tzkt/widgets/controller_bottom_nav.dart';
import 'package:tzkt/widgets/touchable_opacity.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: ListView(
                children: [
                  const Gap(60),
                  MyBalanceSection(),
                  const Gap(20),
                  Divider(
                    thickness: 2.5,
                    color: kDivider,
                  ),
                  const Gap(20),
                  MyAssetsSection(),
                  const Gap(20),
                  Divider(
                    thickness: 2.5,
                    color: kDivider,
                  ),
                  const Gap(20),
                  MoversSection(),
                  const Gap(20),
                  Divider(
                    thickness: 2.5,
                    color: kDivider,
                  ),
                  const Gap(20),
                  TrendingNewSection(),
                  const Gap(120),
                ],
              ),
            ),
            const Align(
              alignment: Alignment.topCenter,
              child: TopAppBar(),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: BottomNav(),
            ),
          ],
        ),
      ),
    );
  }
}

class MyBalanceSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'My balance',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.6000000238418579),
                  fontSize: 14,
                  fontFamily: 'Roobert',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Gap(4),
              TzktAssets.images.svg.eye.svg()
            ],
          ),
          const Gap(10),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '₦',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.949999988079071),
                    fontSize: 18,
                    fontFamily: 'Roobert',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                TextSpan(
                  text: '5,000',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.949999988079071),
                    fontSize: 32,
                    fontFamily: 'Roobert',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                TextSpan(
                  text: '.00',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.949999988079071),
                    fontSize: 18,
                    fontFamily: 'Roobert',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TopAppBar extends StatelessWidget {
  const TopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TzktAssets.images.svg.scan.svg(),
          const Spacer(
            flex: 3,
          ),
          Text(
            'Explore',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black.withOpacity(0.949999988079071),
              fontSize: 18,
              fontFamily: 'Roobert',
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          TzktAssets.images.svg.search.svg(),
          const Gap(16),
          TzktAssets.images.svg.notification.svg(),
        ],
      ),
    );
  }
}

class MyAssetsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final assets = <(SvgPicture, Function(), String, String, String)>[
      (
        TzktAssets.images.svg.btc.svg(),
        () => context.read<BlockCubit>().loadBtcTransactions(),
        'BITCOIN',
        '₦24,500,00',
        'BTC'
      ),
      (
        TzktAssets.images.svg.eth.svg(),
        () {},
        'Ethereum',
        '₦4,500',
        'ETH',
      ),
      (
        TzktAssets.images.svg.tzs.svg(),
        () => context.read<BlockCubit>().loadTezosTransactions(),
        'Tezos',
        '₦4,500',
        'XTZ'
      )
    ];
    return BlocListener<BlockCubit, BlockState>(
      bloc: context.read<BlockCubit>(),
      listener: (context, state) {
        if (state.status == BlockStatus.failure) {
          print(state.resMessage);
        }
        if (state.status.isLoadingBtcTransactions ||
            state.status.isLoadingTezosTransactions) {
          context.navigate(TransactionsPage(
            title: state.status.isLoadingTezosTransactions ? 'Tezos' : 'BTC',
          ));
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'My assets',
                  style: GoogleFonts.inter(
                    color: Colors.black.withOpacity(0.949999988079071),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 0.07,
                  ),
                ),
                Spacer(),
                Text(
                  'See all',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: Color(0xFF11A532),
                    fontSize: 14,

                    fontWeight: FontWeight.w600,
                    height: 0.10,
                  ),
                ),
              ],
            ),
            const Gap(32),
            ...assets.indexed
                .map<Widget>(
                  (x) => TouchableOpacity(
                    onTap: x.$2.$2,
                    child: AssetsWidget(
                      increase: (x.$1 % 2 == 0),
                      leading: x.$2.$1,
                      coinName: x.$2.$3,
                      price: x.$2.$4,
                      coinSymbol: x.$2.$5,
                    ),
                  ),
                )
                .intersperse(
                  Gap(16),
                ),
          ],
        ),
      ),
    );
  }
}

class AssetsWidget extends StatelessWidget {
  const AssetsWidget({
    super.key,
    this.increase = false,
    required this.leading,
    required this.coinName,
    required this.coinSymbol,
    required this.price,
  });

  final bool increase;
  final Widget leading;
  final String coinName;
  final String coinSymbol;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        leading,
        const Gap(16),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              coinName,
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            Gap(2),
            Text(
              coinSymbol,
              style: GoogleFonts.inter(
                color: Color(0xFF9BA0A5),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
        const Spacer(),
        PercentageChange(
          increase: increase,
        ),
      ],
    );
  }
}

class PercentageChange extends StatelessWidget {
  const PercentageChange({
    super.key,
    this.increase = false,
  });

  final bool increase;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '₦24,500,00',
          style: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        Gap(2),
        PumpDumpText(
          increase: increase,
        )
      ],
    );
  }
}

class PumpDumpText extends StatelessWidget {
  const PumpDumpText({
    super.key,
    this.increase = false,
  });
  final bool increase;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        increase
            ? TzktAssets.images.svg.arrowUp.svg()
            : TzktAssets.images.svg.arrowDown.svg(),
        Text(
          '1.76%',
          textAlign: TextAlign.end,
          style: GoogleFonts.inter(
            color: increase ? Color(0xFF11A532) : Color(0xFFC00F00),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}

class MoversSection extends StatelessWidget {
  MoversSection({super.key});

  final movers = <(SvgPicture, String)>[
    (
      TzktAssets.images.svg.eth.svg(),
      'Ethereum',
    ),
    (
      TzktAssets.images.svg.btc.svg(),
      'Bitcoin',
    ),
    (
      TzktAssets.images.svg.sol.svg(),
      'Solana',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Today’s Top Movers',
                style: GoogleFonts.inter(
                  color: Colors.black.withOpacity(0.949999988079071),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              Text(
                'See all',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: Color(0xFF11A532),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const Gap(20),
          SizedBox(
            height: context.screenHeight(.14),
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                ...movers.indexed
                    .map<Widget>((e) => MoversCardItem(
                          leading: e.$2.$1,
                          title: e.$2.$2,
                          increase: (e.$1 % 2 == 0),
                        ))
                    .intersperse(
                      const Gap(8),
                    )
                // MoversCardItem(),
                // const Gap(8),
                // MoversCardItem(),

                // MoversCardItem(),
                // const Gap(8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MoversCardItem extends StatelessWidget {
  const MoversCardItem({
    super.key,
    required this.leading,
    required this.title,
    this.increase = true,
  });
  final Widget leading;
  final String title;
  final bool increase;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: context.screenWidth(.35),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.black.withOpacity(0.11999999731779099),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          leading,
          const Gap(16),
          Text(
            title,
            style: GoogleFonts.inter(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 0.09,
            ),
          ),
          const Gap(16),
          PumpDumpText(
            increase: increase,
          )
        ],
      ),
    );
  }
}

class TrendingNewSection extends StatelessWidget {
  const TrendingNewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Trending news',
                style: GoogleFonts.inter(
                  color: Colors.black.withOpacity(0.949999988079071),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 0.07,
                ),
              ),
              Spacer(),
              Text(
                'View more',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: Color(0xFF11A532),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const Gap(20),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: context.screenWidth(),
                height: context.screenHeight(.22),
                decoration: ShapeDecoration(
                  image: DecorationImage(
                      image: AssetImage(TzktAssets.images.png.elonWide.path),
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
              ),
              const Gap(16),
              Text(
                'Ethereum Co-founder opposes El-salvador Bitcoin Adoption policy',
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Gap(8),
              Text(
                'CoinDesk • 2h',
                style: GoogleFonts.inter(
                  color: Color(0xFF9BA0A5),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Gap(12),
              ...List<Widget>.generate(7, (inded) => TrendingNewItem())
                  .intersperse(
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Divider(
                    thickness: 1.5,
                    color: kDivider,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TrendingNewItem extends StatelessWidget {
  const TrendingNewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: context.screenWidth(.11),
          height: context.screenHeight(.06),
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: AssetImage(TzktAssets.images.png.elonNarrow.path),
              fit: BoxFit.fill,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        const Gap(16),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: context.screenWidth(.7),
              child: Text(
                'Ethereum Co-founder opposes El-salvador Bitcoin Adoption policy',
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const Gap(8),
            Text(
              'CoinDesk • 2h',
              style: GoogleFonts.inter(
                color: Color(0xFF9BA0A5),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 0.10,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
