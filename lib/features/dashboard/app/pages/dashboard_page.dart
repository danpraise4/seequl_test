import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seequl/core/provider/ToShowProvider.dart';
import 'package:seequl/core/widget/AppBottomNav/AppButtomNav.dart';
import 'package:seequl/features/timeline/app/pages/timeline_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    bool show = context.watch<ToShowProvider>().show ?? true;
    return Scaffold(
      bottomNavigationBar: show ? const AppBottomNav() : null,
      body: PageView(
        children: const [TimelineFullView()],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
