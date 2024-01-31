import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../common/header_text.dart';

class SearchResultHeader extends HookWidget {
  const SearchResultHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: HeaderText(
        text: '검색 결과',
        fontSize: 20.0,
      ),
    );
  }
}
