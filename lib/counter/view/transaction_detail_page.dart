import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:tzkt/assets/assets.gen.dart';
import 'package:tzkt/core/services/services.dart';
import 'package:tzkt/utils/extenstions.dart';
import 'package:tzkt/widgets/controller_bottom_nav.dart';
import 'package:tzkt/widgets/touchable_opacity.dart';

class TransactionDetailModel {
  final String hash;
  final String time;
  final String sizeOrLevel;
  final String blockIndexOrReward;
  final String heightOrBonus;
  final String receivedtimeOrFees;
  final bool isTezos;
  TransactionDetailModel({
    required this.hash,
    required this.time,
    required this.sizeOrLevel,
    required this.blockIndexOrReward,
    required this.heightOrBonus,
    required this.receivedtimeOrFees,
    this.isTezos = false,
  });
}

class TransactionDetailPage extends StatelessWidget {
  const TransactionDetailPage({
    super.key,
    required this.details,
  });

  final TransactionDetailModel details;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        leading: TouchableOpacity(
          onTap: () => context.pop(),
          child: TzktAssets.images.svg.backButton.svg(fit: BoxFit.scaleDown),
        ),
        title: Text(
          'Transaction details',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black.withOpacity(0.949999988079071),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            height: 0.07,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
        ),
        children: [
          const Gap(8),
          DetailItem(
            titleText: 'Hash',
            detailText: details.hash,
          ),
          DetailItem(
            titleText: 'Time',
            detailText: details.time,
          ),
          DetailItem(
            titleText: details.isTezos ? 'Level' : 'Size',
            detailText: details.sizeOrLevel,
          ),
          DetailItem(
            titleText: details.isTezos ? 'Reward' : 'Block Index',
            detailText: details.blockIndexOrReward,
          ),
          DetailItem(
            titleText: details.isTezos ? 'Bonus' : 'Height',
            detailText: details.heightOrBonus,
          ),
          DetailItem(
            titleText: details.isTezos ? 'Fees' : 'Received time',
            detailText: details.receivedtimeOrFees,
            showDivider: false,
          ),
          const Gap(36),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TzktAssets.images.svg.openInBrowser.svg(),
              const Gap(16),
              Text(
                'View on blockchain explorer',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.949999988079071),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Spacer(),
              TzktAssets.images.svg.arrowRight.svg(),
            ],
          )
        ],
      ),
    );
  }
}

class DetailItem extends StatelessWidget {
  const DetailItem({
    super.key,
    this.titleText = '',
    this.detailText = '',
    this.showDivider = true,
  });
  final String titleText;
  final String detailText;
  final bool showDivider;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titleText,
              style: TextStyle(
                color: Colors.black.withOpacity(0.6000000238418579),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
            Spacer(),
            SizedBox(
              width: context.screenWidth(.53),
              child: Text(
                detailText,
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.949999988079071),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
        const Gap(8),
        if (showDivider)
          Divider(
            thickness: 1.5,
            color: kDivider,
          ),
      ],
    );
  }
}
