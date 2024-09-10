import 'package:flutter/material.dart';
import 'package:myportfolio/main_page/scroll_column/scroll_column.dart';

class CustomScrollViewWidget extends StatelessWidget {
  final ScrollController scrollController;
  final ScrollColumn scrollColumn;

  const CustomScrollViewWidget({
    super.key,
    required this.scrollController,
    required this.scrollColumn,
  });

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      controller: scrollController,
      thickness: 5,
      radius: const Radius.circular(5),
      trackVisibility: false,
      thumbColor: Theme.of(context).colorScheme.primary.withOpacity(0.7),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          scrollbars: false,
        ),
        child: SingleChildScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          child: scrollColumn,
        ),
      ),
    );
  }
}
