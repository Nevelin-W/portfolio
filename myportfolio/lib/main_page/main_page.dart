import 'package:flutter/material.dart';
import 'package:myportfolio/main_page/custom_scroll_view.dart';
import 'package:myportfolio/main_page/scroll_column/scroll_column.dart';
import 'package:myportfolio/main_page/static_column/static_column.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  // Global keys for experience and projects sections
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();

  // Scroll controller for scrolling functionality
  final ScrollController _scrollController = ScrollController();
  
  double _indicatorPosition = 0; // Indicator position for the UI
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _initializeScrollController();
    _initializeFadeAnimation();
  }

  void _initializeScrollController() {
    _scrollController.addListener(_onScroll);
  }

  void _initializeFadeAnimation() {
    // Initialize fade-in animation for the content of MainPage
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 4000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.fastEaseInToSlowEaseOut),
    );

    // Start the fade-in animation after the page build is complete
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fadeController.forward();
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Use null-aware operators to safely access context
    final experienceContext = _experienceKey.currentContext;
    final projectsContext = _projectsKey.currentContext;

    if (experienceContext != null && projectsContext != null) {
      final experienceBox = experienceContext.findRenderObject() as RenderBox;
      final projectsBox = projectsContext.findRenderObject() as RenderBox;

      // Update indicator position based on scroll offset
      setState(() {
        if (_scrollController.offset >= experienceBox.localToGlobal(Offset.zero).dy - 100 &&
            _scrollController.offset < projectsBox.localToGlobal(Offset.zero).dy - 100) {
          _indicatorPosition = 1; // Experience section
        } else if (_scrollController.offset >= projectsBox.localToGlobal(Offset.zero).dy - 100) {
          _indicatorPosition = 2; // Projects section
        } else {
          _indicatorPosition = 0; // Initial position
        }
      });
    }
  }

  // Scroll to the top of the page
  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  // Scroll to a specific section based on the provided key
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
      body: FadeTransition(
        opacity: _fadeAnimation, // Apply the fade-in animation to MainPage content
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            // Determine if the screen size requires a single or dual column layout
            bool isSmallScreen = constraints.maxWidth < 900;

            return Container(
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
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                  child: SingleChildScrollView(
                    scrollDirection: isSmallScreen ? Axis.vertical : Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      constraints: BoxConstraints(
                        maxWidth: isSmallScreen ? 600 : 1100,
                      ),
                      child: isSmallScreen ? _buildSmallScreenLayout() : _buildLargeScreenLayout(),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Widget layout for small screens
  Widget _buildSmallScreenLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 100),
        StaticColumn(
          onAboutPressed: _scrollToTop,
          onExperiencePressed: () => _scrollToSection(_experienceKey),
          onProjectsPressed: () => _scrollToSection(_projectsKey),
          indicatorPosition: _indicatorPosition,
        ),
        const SizedBox(height: 10),
        ScrollColumn(
          experienceKey: _experienceKey,
          projectsKey: _projectsKey,
        ),
      ],
    );
  }

  // Widget layout for large screens
  Widget _buildLargeScreenLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: StaticColumn(
            onAboutPressed: _scrollToTop,
            onExperiencePressed: () => _scrollToSection(_experienceKey),
            onProjectsPressed: () => _scrollToSection(_projectsKey),
            indicatorPosition: _indicatorPosition,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: CustomScrollViewWidget(
            scrollController: _scrollController,
            scrollColumn: ScrollColumn(
              experienceKey: _experienceKey,
              projectsKey: _projectsKey,
            ),
          ),
        ),
      ],
    );
  }
}
