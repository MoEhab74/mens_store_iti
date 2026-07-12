import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mens_store/core/themes/app_colors.dart';
import 'package:mens_store/core/themes/app_styles.dart';
import 'package:mens_store/core/ui/app_divider.dart';
import 'package:mens_store/core/ui/loading_lottie.dart';
import 'package:mens_store/features/account/cubits/addresses_cubit.dart';
import 'package:mens_store/features/account/cubits/addresses_state.dart';
import 'package:mens_store/features/account/widgets/address_widget.dart';

class AddressScreenBody extends StatelessWidget {
  const AddressScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressesCubit()..getAllAddresses(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Address Book',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: BlocBuilder<AddressesCubit, AddressesState>(
            builder: (context, state) {
              if (state is AddressesLoading) {
                return const Center(child: LoadingLottie());
              }
              if (state is AddressesError) {
                return Center(child: Text(state.error));
              }
              if (state is AddressesSuccess) {
                var addresses = state.addresses;
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppDivider(indent: 8, endIndent: 8),
                      SizedBox(height: 24.h),
                      Text(
                        'Saved Addresses',
                        style: AppStyles.bodyBlackStyle.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Expanded(
                        child: ListView.builder(
                          itemCount: addresses.length,
                          itemBuilder: (context, index) {
                            return AddressWidget(
                              addressTitle: addresses[index].name,
                              addressDetails: addresses[index].description,
                              onTap: () {
                                
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }
              return SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
