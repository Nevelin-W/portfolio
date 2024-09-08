import 'package:flutter/material.dart';
import 'package:myportfolio/main_page/scroll_column/scroll_column.dart';
import 'package:myportfolio/main_page/static_column/static_column.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  double _indicatorPosition = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final experienceContext = _experienceKey.currentContext;
    final projectsContext = _projectsKey.currentContext;

    if (experienceContext != null && projectsContext != null) {
      final experienceBox = experienceContext.findRenderObject() as RenderBox;
      final projectsBox = projectsContext.findRenderObject() as RenderBox;

      if (_scrollController.offset >=
              experienceBox.localToGlobal(Offset.zero).dy - 100 &&
          _scrollController.offset <
              projectsBox.localToGlobal(Offset.zero).dy - 100) {
        setState(() {
          _indicatorPosition = 1;
        });
      } else if (_scrollController.offset >=
          projectsBox.localToGlobal(Offset.zero).dy - 100) {
        setState(() {
          _indicatorPosition = 2;
        });
      } else {
        setState(() {
          _indicatorPosition = 0;
        });
      }
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const RadialGradient(
            colors: [Colors.pink, Colors.orange],
            center: Alignment(-0.5, -0.5),
            radius: 0.6,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 15,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Center(
          child: Container(
            constraints:
                BoxConstraints.tight(const Size(1100, double.infinity)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StaticColumn(
                  onAboutPressed: _scrollToTop,
                  onExperiencePressed: () => _scrollToSection(_experienceKey),
                  onProjectsPressed: () => _scrollToSection(_projectsKey),
                  indicatorPosition: _indicatorPosition,
                ),
                const SizedBox(width: 10),
                ScrollColumn(
                  experienceKey: _experienceKey,
                  projectsKey: _projectsKey,
                  scrollController: _scrollController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
