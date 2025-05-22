part of '../../search_result_screen.dart';

class _SearchResultsBody extends StatelessWidget {
  const _SearchResultsBody({
    required this.controller,
    required this.keywordHeader,
    required this.searchChannels,
    required this.searchLives,
    required this.searchVods,
  });

  final ScrollController controller;
  final Widget keywordHeader;
  final Widget searchChannels;
  final Widget searchLives;
  final Widget searchVods;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          keywordHeader,
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              controller: controller,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  searchChannels,
                  searchLives,
                  searchVods,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
