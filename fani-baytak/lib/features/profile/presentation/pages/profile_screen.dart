import 'package:neomsim/core/helpers/helper_function.dart';
import 'package:neomsim/core/routes/app_router.dart';
import 'package:neomsim/core/routes/common_import.dart';
import 'package:neomsim/core/widgets/horizontal_sized_box.dart';
import 'package:neomsim/core/widgets/vertical_sized_box.dart';
import 'package:neomsim/features/web_page/web_page_screen.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalSizedBox(20),
              Text(
                S.of(context).account,
                style: context.subTitle,
              ),
              const VerticalSizedBox(5),
              _mainContainer(
                child: Column(
                  children: [
                    _buildMainRow(
                      context,
                      label: S.of(context).editProfile,
                      icon: Icons.person,
                      function: () => Navigator.pushNamed(
                        context,
                        AppRouter.registerOrUpdate,
                        arguments: true,
                      ),
                    ),
                    _buildMainRow(
                      context,
                      label: S.of(context).privacyAndSecurity,
                      icon: Icons.privacy_tip,
                      function: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebPageScreen(
                            page: S.of(context).privacyAndSecurity,
                            desc: privacyAndSecurity,
                          ),
                        ),
                      ),
                    ),
                    _buildMainRow(
                      context,
                      label: S.of(context).notification,
                      icon: Icons.notification_important_sharp,
                      function: () {},
                    ),
                    _buildMainRow(
                      context,
                      label: S.of(context).bookingList,
                      icon: Icons.list_alt,
                      function: () => Navigator.pushNamed(
                        context,
                        AppRouter.bookingList,
                      ),
                    ),
                  ],
                ),
              ),
              const VerticalSizedBox(20),
              Text(
                S.of(context).supportAndAbout,
                style: context.subTitle,
              ),
              const VerticalSizedBox(5),
              _mainContainer(
                child: Column(
                  children: [
                    _buildMainRow(
                      context,
                      label: S.of(context).contactUs,
                      icon: Icons.help,
                      function: () => isAdmin()
                          ? Navigator.pushNamed(
                              context,
                              AppRouter.getContactUs,
                            )
                          : Navigator.pushNamed(
                              context,
                              AppRouter.contactUs,
                            ),
                    ),
                    _buildMainRow(
                      context,
                      label: S.of(context).termAndPolicies,
                      icon: Icons.policy,
                      function: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebPageScreen(
                            page: S.of(context).termAndPolicies,
                            desc: termAndPolicy,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const VerticalSizedBox(20),
              Text(
                S.of(context).actions,
                style: context.subTitle,
              ),
              const VerticalSizedBox(5),
              _mainContainer(
                child: Column(
                  children: [
                    _buildMainRow(
                      context,
                      label: S.of(context).reportAndProblem,
                      icon: Icons.flag,
                      function: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebPageScreen(
                            page: S.of(context).reportAndProblem,
                            desc: reportProblem,
                          ),
                        ),
                      ),
                    ),
                    _buildMainRow(
                      context,
                      label: S.of(context).logout,
                      icon: Icons.logout,
                      function: () => logoutFunction(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _mainContainer({
    required Widget child,
  }) =>
      Container(
        decoration: BoxDecoration(
          color: AppColors.greyBorderFiledColor,
          borderRadius: BorderRadius.circular(13.r),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 10.h,
        ),
        child: child,
      );

  Widget _buildMainRow(
    BuildContext context, {
    required String label,
    required IconData icon,
    required void Function() function,
  }) =>
      Padding(
        padding: EdgeInsetsDirectional.only(bottom: 5.h),
        child: InkWell(
          onTap: function,
          child: Row(
            children: [
              Icon(
                icon,
                size: 30.h,
              ),
              const HorizontalSizedBox(10),
              Text(
                label,
                style: context.mainBody,
              ),
            ],
          ),
        ),
      );
  String reportProblem = '''
“If you encounter any issue while using the app, please let us know so we can resolve it as quickly as possible. We value your feedback and are committed to improving your experience continuously.”

Contact Us:
Email
* support@neomism.com (for technical support). • info@neomism.com (for general inquiries).
Phone Number
* Numbers First:
* Local Phone: +96655566890
* International Number: +966554327876
* Working Hours:
* Weekdays: 9:00 AM - 6:00 PM (Saudi time).
''';

  String termAndPolicy = '''
*NEOMISM TERMS AND POLICIES*

 1.⁠ ⁠Introduction
By using the NEOMISM app, you agree to follow these terms. Please read them carefully.

 2.⁠ ⁠User Responsibilities
•⁠  ⁠Provide accurate information when creating an account.
•⁠  ⁠Keep your login details secure.
•⁠  ⁠Use the app for its intended purpose and comply with all local laws.

 3.⁠ ⁠Privacy
•⁠  ⁠We only collect information necessary to provide and improve our services.
•⁠  ⁠Your data will not be shared with others unless required by law.

 4.⁠ ⁠Booking and Payment
•⁠  ⁠All bookings made through the app are subject to availability and must be confirmed.
•⁠  ⁠Payments are processed securely using accepted methods.

 5.⁠ ⁠Cancellations and Refunds
•⁠  ⁠Cancellations and refunds follow the rules set by the service providers (hotels, events, etc.).

 6.⁠ ⁠Acceptable Use
•⁠  ⁠Do not use the app for illegal activities or to harm others.
•⁠  ⁠Respect the rules and guidelines provided within the app.

 7.⁠ ⁠Limitation of Liability
•⁠  ⁠NEOMISM is not responsible for problems caused by third-party services or unexpected technical issues.

 8.⁠ ⁠Security
•⁠  ⁠We protect your data with strong security measures.
•⁠  ⁠Notify us immediately if you suspect unauthorized access to your account.

 9.⁠ ⁠Intellectual Property
•⁠  ⁠All content and designs in the application are owned by NEOMISM.
•⁠  ⁠Do not copy or share our content without permission.

10.⁠ ⁠Updates to Terms
•⁠  ⁠We may update these terms from time to time. Continued use of the application means your acceptance of any changes.

11.⁠ ⁠Governing Law
•⁠  ⁠These terms are governed by the laws of the Kingdom of Saudi Arabia.

''';

  String privacyAndSecurity = '''
Privacy and Security Policy
At NEOMISM, we are committed to respecting your privacy and protecting your
personal data in accordance with the highest standards of security and
transparency. This commitment aligns with the laws and regulations of the
Kingdom of Saudi Arabia, including the Saudi Personal Data Protection Law
(PDPL).
1. Collection of Personal Information
We collect the following types of information when you use our application:
Account Information: Such as your name, phone number, email address, and other
details provided during registration.
Device Information: Such as device type, operating system, and IP address. User
Activity: Such as interactions within the app and data related to feature usage.
Location Information: If you consent, we may use location data to enhance our
services.
2. Use of Data
We use your data for the following purposes:
To improve user experience and develop new features.
To process requests and provide technical support.
To send notifications and alerts related to the service.
To comply with local laws and regulations.
3. Data Storage and Security
Data is stored using Firebase, a secure platform that complies with international
data protection standards.
Data is encrypted during transmission using SSL and at rest using AES-256
encryption.
We retain your data only as long as necessary to fulfill the purposes stated or to
comply with local regulations.
4. Data Sharing
We do not share your data with third parties except in the following cases:
When required by law or upon the request of competent authorities in the
Kingdom.
With trusted service providers (such as Firebase) who assist us in operating the
application, under strict obligations to protect your data.
5. Your Rights
Under the Saudi Personal Data Protection Law, you have the following rights:
Access your personal data.
Request correction or updates to your data.
Request the deletion of your data when no longer needed.
Object to the processing of your data in certain cases.
To exercise these rights, please contact us at [Contact Information].
6. Cookies
We use cookies to enhance the performance of the application. You may disable
cookies through your device settings; however, this may affect certain features of
the app.
7. Policy Updates
We may update this policy periodically. You will be notified of any significant
changes through the application or via email.
8. Contact Us
For any inquiries or feedback regarding this privacy policy, please contact us
''';
}
