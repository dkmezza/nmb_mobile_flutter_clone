import 'package:flutter/material.dart';
import 'package:nmb_mobile_clone/core/constants/app_constants.dart';


class QuickServicesScreen extends StatelessWidget {
  const QuickServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        foregroundColor: AppColors.whiteBackground,
        title: const Text(
          'Quick Services',
          style: AppTextStyles.appBarText,
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppDimensions.largePadding),
        child: Column(
          children: [
            const SizedBox(height: AppDimensions.largePadding),
            Icon(
              Icons.flash_on,
              size: 80,
              color: AppColors.primaryOrange,
            ),
            const SizedBox(height: AppDimensions.largePadding),
            const Text(
              'Quick Services',
              style: AppTextStyles.greetingText,
            ),
            const SizedBox(height: AppDimensions.mediumPadding),
            const Text(
              'Access limited banking services without full authentication.',
              style: AppTextStyles.instructionText,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimensions.extraLargePadding),
            _buildServiceButton(
              context,
              icon: Icons.account_balance_wallet,
              title: 'Check Balance',
              subtitle: 'View your account balance',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Balance check feature coming soon'),
                  ),
                );
              },
            ),
            const SizedBox(height: AppDimensions.mediumPadding),
            _buildServiceButton(
              context,
              icon: Icons.location_on,
              title: 'Find ATM',
              subtitle: 'Locate nearest NMB ATM',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('ATM locator feature coming soon'),
                  ),
                );
              },
            ),
            const SizedBox(height: AppDimensions.mediumPadding),
            _buildServiceButton(
              context,
              icon: Icons.phone,
              title: 'Contact Support',
              subtitle: 'Get help from our team',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Support contact feature coming soon'),
                  ),
                );
              },
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryOrange,
                  foregroundColor: AppColors.whiteBackground,
                  padding: const EdgeInsets.symmetric(
                    vertical: AppDimensions.mediumPadding,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      AppDimensions.mediumBorderRadius,
                    ),
                  ),
                ),
                child: const Text(
                  'Back to Login',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceButton(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: AppDimensions.buttonElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.mediumBorderRadius),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          padding: const EdgeInsets.all(AppDimensions.smallPadding),
          decoration: BoxDecoration(
            color: AppColors.primaryBlue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppDimensions.smallBorderRadius),
          ),
          child: Icon(
            icon,
            color: AppColors.primaryBlue,
            size: AppDimensions.mediumIconSize,
          ),
        ),
        title: Text(
          title,
          style: AppTextStyles.bodyText.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: AppTextStyles.smallText,
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: AppDimensions.smallIconSize,
          color: AppColors.secondaryTextColor,
        ),
      ),
    );
  }
}