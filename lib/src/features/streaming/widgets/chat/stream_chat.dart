import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/widgets/ui/ui_widgets.dart' show CenteredText;

class StreamChat<T> extends StatelessWidget {
  const StreamChat({super.key, required this.chatStream});

  final AsyncValue<List<T>> chatStream;

  @override
  Widget build(BuildContext context) {
    return chatStream.when(
      data: (chatList) {
        return Container();
      },
      error: (_, __) => const CenteredText(text: '채팅을 불러오는데 실패했습니다'),
      loading: () => const SizedBox.shrink(),
    );
  }
}
