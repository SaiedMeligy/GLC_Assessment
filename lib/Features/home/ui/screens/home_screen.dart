import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_top_bar.dart';
import '../../logic/home_cubit.dart';
import '../../logic/home_states.dart';
import '../widgets/custom_list_item.dart';
import '../widgets/due_bill_widget.dart';
import '../widgets/miza_widget.dart';
import '../widgets/offers_widget.dart';
import '../widgets/quick_action_widget.dart';
import '../widgets/trend_company.dart';
import '../widgets/wallet_Card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading || state is HomeInitial) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (state is HomeError) {
          return Center(child: Text('Error: ${state.message}'));
        } else if (state is HomeLoaded) {
          final balance = state.balance;
          final username = state.username;
          final services = state.services;

          return Scaffold(
            backgroundColor: Colors.grey.shade100,
            appBar: AppTopBar(
              title: 'Vodafone Cash',
              username: username,
              balance: balance,
              onRefresh: () => context.read<HomeCubit>().refreshBalance(),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    WalletCardWidget(balance: balance),
              
                    SizedBox(
                      height: 250.h,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // Black background strip
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(height: 100.h, color: Colors.black),
                          ),
                          // Due Bills card
                          Positioned(left: 12, right: 12,top: 10, child: const DueBillWidget()),
                          Positioned(
                            top: 70,
                            left: 12,
                            right: 12,
                            child: Row(
                              children: [
                                Expanded(
                                  child: QuickActionWidget(
                                    title: 'Money\nTransfer',
                                    icon: Icons.sync_alt,
                                    onTap: () {},
                                  ),
                                ),
                                 SizedBox(width: 10.w),
                                Expanded(
                                  child: QuickActionWidget(
                                    title: 'Recharge\nBalance',
                                    icon: Icons.phone_android,
                                    onTap: () {},
                                  ),
                                ),
                                 SizedBox(width: 10.w),
                                Expanded(
                                  child: QuickActionWidget(
                                    title: 'Flex\nRenewal',
                                    icon: Icons.autorenew,
                                    onTap: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
              
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 12.w),
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: Image.asset(
                            'assets/images/vodafone-banner.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
              
                     SizedBox(height: 12.h),
              
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 12.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Text(
                            'Pay by Vodafone Cash',
                            style: TextStyles.font20blackBold,
                          ),
                          InkWell(
                            onTap: () {
              
                            },
                            child: Row(
                              children: [
                                Text('More',style: TextStyles.font12BlackBold.copyWith(
                                  color: Colors.red
                                ),),
                                Icon(Icons.keyboard_arrow_right_outlined,color: Colors.red,)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
              
                    const SizedBox(height: 12),
              
                    Container(
                      decoration: BoxDecoration(
                        color: ColorsManager.whiteColor
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: services.map((service) {
                            return SizedBox(
                              width: (MediaQuery.of(context).size.width - 60) / 4,
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.grey.shade300,
                                        width: 1, // Border thickness
                                      ),
                                    ),
                                    child: CircleAvatar(
                                      radius: 23.r,
                                      backgroundColor: Colors.transparent,
                                      child: Icon(service.icon, color: Colors.black87),
                                    ),
                                  ),
                                   SizedBox(height: 6.h),
                                  Text(
                                    service.title,
                                    textAlign: TextAlign.center,
                                    style:  TextStyles.font12BlackSemiBold.copyWith(
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
              
                     SizedBox(height: 20.h),
                    OffersWidget(
                      imageUrls: [
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxj9b51cZT1tQSH3-hV5xObu5w1sdgnoH26g&s',
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4ZzjcdsrjMjlSgft2OIj2gyfHrVCnuTfGPw&s',
                        'https://web.vodafone.com.eg/documents/9749002/9750437/19.5.jpg/53757942-ab99-d35c-8a0f-8744dbd64d8e?t=1733454405342'
                      ],
                    ),
                     SizedBox(height: 20.h),
                    MeezaWidget(),
                     SizedBox(height: 10.h),

                    OnlineCompany(
                      assetPaths: [
                        'assets/images/amaazon.jpg',
                        'assets/images/noons.png',
                        'assets/images/amenli.png',
                        'assets/images/CairoCart.png',
                        'assets/images/incredi.png',

                      ],
                    ),

                     SizedBox(height: 20.h),

                     Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'More Services',
                        style: TextStyles.font30BlackBold.copyWith(
                          color: Colors.grey.shade700,
                          fontSize: 25.sp
                        )
                      ),
                    ),

                    const SizedBox(height: 8),
                    Column(
                      children: [
                        CustomListItem(
                          title: 'Create PIN',
                          trailingIcon: Icons.arrow_forward_ios,
                          onTap: () {},
                        ),
                        CustomListItem(
                          title: 'Reset PIN',
                          trailingIcon: Icons.arrow_forward_ios,
                          onTap: () {},

                        ),
                        CustomListItem(
                          title: 'Cash Locator',
                          trailingIcon: Icons.arrow_forward_ios,
                          onTap: () {},

                        ),
                        CustomListItem(
                          title: 'Help',
                          isLast: true,
                          trailingIcon: Icons.arrow_forward_ios,
                          onTap: () {},

                        ),
                      ],
                    )


                  ],
                ),
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
