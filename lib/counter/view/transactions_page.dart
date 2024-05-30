import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intersperse/intersperse.dart';
import 'package:tzkt/assets/assets.gen.dart';
import 'package:tzkt/core/services/navigation.service.dart';
import 'package:tzkt/counter/counter.dart';
import 'package:tzkt/counter/view/transaction_detail_page.dart';
import 'package:tzkt/widgets/controller_bottom_nav.dart';
import 'package:tzkt/widgets/touchable_opacity.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key, this.title = 'BTC'});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BlockCubit, BlockState>(
      bloc: context.read<BlockCubit>(),
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final view = switch (state.status) {
          BlockStatus.initial ||
          BlockStatus.loadingBtcTransactions ||
          BlockStatus.loadingTezosTransactions =>
            Center(
              child: SizedBox(
                height: 100,
                width: 100,
                child: CircularProgressIndicator(
                  
                  strokeCap: StrokeCap.round,
                  color: Color(0xff13A734),
                  strokeWidth: 8,
                ),
              ),
            ),
          BlockStatus.failure => Center(
              child: Text(
                'Failed to load your transactions',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          BlockStatus.successBtcTransactions => ListView(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              children: [
                const Gap(24),
                ...state.btcTransactions
                    .map<Widget>(
                      (e) => TransactionItem(
                        hash: e.hash,
                        date: '2019-08-24 • 15:43',
                        transactionDetail: TransactionDetailModel(
                          hash: e.hash,
                          time: '${e.lock_time}',
                          sizeOrLevel: '${e.size}',
                          blockIndexOrReward: '${e.tx_index}',
                          heightOrBonus: '${e.block_height}',
                          receivedtimeOrFees: '${e.lock_time}',
                        ),
                      ),
                    )
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
          BlockStatus.successTezosTransactions => ListView(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              children: [
                const Gap(24),
                ...state.tezosBlocks
                    .map<Widget>(
                      (e) => TransactionItem(
                        hash: e.hash,
                        date: '2019-08-24 • 15:43',
                        transactionDetail: TransactionDetailModel(
                            hash: e.hash,
                            time: '${e.timestamp}',
                            sizeOrLevel: '${e.level}',
                            blockIndexOrReward: '${e.reward}',
                            heightOrBonus: '${e.bonus}',
                            receivedtimeOrFees: '${e.fees}',
                            isTezos: true),
                      ),
                    )
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
        };

        return Scaffold(
          appBar: AppBar(
            backgroundColor: white,
            leading: TouchableOpacity(
              onTap: () => context.pop(),
              child:
                  TzktAssets.images.svg.backButton.svg(fit: BoxFit.scaleDown),
            ),
            title: Text(
              '$title transactions',
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
          body: view,
        );
      },
    );
  }
}

class TransactionItem extends StatelessWidget {
  TransactionItem({
    super.key,
    required this.hash,
    required this.date,
    required this.transactionDetail,
  });
  final String hash;
  final String date;
  final TransactionDetailModel transactionDetail;
  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: () => context.navigate(
        TransactionDetailPage(
          details: transactionDetail,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  hash,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.949999988079071),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Gap(8),
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5600000023841858),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
          // Spacer(),
          TzktAssets.images.svg.arrowRight.svg()
        ],
      ),
    );
  }
}
