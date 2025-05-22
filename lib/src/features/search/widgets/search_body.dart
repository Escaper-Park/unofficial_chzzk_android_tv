import 'package:flutter/material.dart';

import '../../../common/constants/dimensions.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({
    super.key,
    required this.searchHeader,
    required this.searchField,
    required this.keyboard,
    required this.autoComplete,
  });

  final Widget searchHeader;
  final Widget searchField;
  final Widget keyboard;
  final Widget autoComplete;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      searchHeader,
                      searchField,
                    ],
                  ),
                ),
              ),
              keyboard,
            ],
          ),
        ),
        SizedBox(
          width: Dimensions.autoCompleteWidth,
          child: autoComplete,
        ),
      ],
    );
  }
}
