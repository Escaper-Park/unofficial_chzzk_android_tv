part of '../../group_screen.dart';

class _GroupBody extends StatelessWidget {
  const _GroupBody({
    required this.groupIsEmpty,
    required this.header,
    required this.groupGenerateButton,
    required this.groupList,
    required this.groupDetail,
  });

  final bool groupIsEmpty;
  final Widget header;
  final Widget groupGenerateButton;
  final Widget groupList;
  final Widget groupDetail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: header),
              groupGenerateButton,
            ],
          ),
          const Divider(),
          // list and detail
          Expanded(
            child: groupIsEmpty
                ? CenteredText(
                    text: '먼저 그룹을 만들어주세요',
                    fontSize: 16.0,
                  )
                : Row(
                    children: [
                      groupList,
                      Expanded(child: groupDetail),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
