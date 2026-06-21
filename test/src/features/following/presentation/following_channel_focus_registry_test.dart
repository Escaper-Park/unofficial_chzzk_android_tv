import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/following/presentation/view/shared/following_channel_focus_registry.dart';

void main() {
  test('release removes channel focus node and anchor link', () {
    final registry = FollowingChannelFocusRegistry();
    addTearDown(registry.dispose);

    final node = registry.nodeFor('channel-a');
    final link = registry.linkFor('channel-a');

    registry.release('channel-a');

    expect(registry.maybeNodeFor('channel-a'), isNull);
    expect(registry.maybeLinkFor('channel-a'), isNull);
    expect(registry.nodeFor('channel-a'), isNot(same(node)));
    expect(registry.linkFor('channel-a'), isNot(same(link)));
  });

  test('maybeNodeFor ignores unmounted focus nodes', () {
    final registry = FollowingChannelFocusRegistry();
    addTearDown(registry.dispose);

    registry.nodeFor('channel-a');

    expect(registry.maybeNodeFor('channel-a'), isNull);
  });
}
