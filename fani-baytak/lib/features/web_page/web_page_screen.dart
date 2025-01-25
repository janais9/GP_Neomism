import 'package:neomsim/core/routes/common_import.dart';
import 'package:neomsim/core/widgets/custom_app_bar.dart';

class WebPageScreen extends StatelessWidget {
  const WebPageScreen({
    super.key,
    required this.page,
    required this.desc,
  });
  final String page, desc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: page,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        child: SingleChildScrollView(
          child: Text(
            desc,
          ),
        ),
      ),
    );
  }
}
