import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/data/dtos/vod_dtos.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/data/mappers/vod_mapper.dart';

void main() {
  test('maps vod playback dto into flattened domain playback', () {
    const dto = VodPlaybackDto(
      mpd: [
        VodPlaybackMpdDto(
          period: [
            VodPlaybackPeriodDto(
              adaptationSet: [
                VodPlaybackAdaptationSetDto(
                  naverVodM3u: 'https://example.com/master.m3u8',
                ),
              ],
              supplementalProperty: [
                VodPlaybackSupplementalPropertyDto(
                  thumbnails: [
                    VodPlaybackThumbnailsDto(
                      seekingThumbnail: [
                        VodPlaybackSeekingThumbnailDto(
                          type: 'l_10x10',
                          page: [
                            VodPlaybackThumbnailPageDto(
                              total: '1',
                              row: '10',
                              column: '10',
                              totalPieceSize: '77',
                            ),
                          ],
                          piece: [
                            VodPlaybackThumbnailPieceDto(
                              intervalType: 'millisecond',
                              interval: '2000',
                              width: '320',
                              height: '180',
                            ),
                          ],
                          source: [
                            VodPlaybackThumbnailSourceDto(
                              patternType: 'sequence_pattern',
                              text: 'https://example.com/sprite_#.jpg',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );

    final playback = vodPlaybackFromDto(dto);

    expect(playback.masterPlaylistUrl, 'https://example.com/master.m3u8');
    expect(playback.seekThumbnail?.source, 'https://example.com/sprite_#.jpg');
    expect(playback.seekThumbnail?.totalPage, 1);
    expect(playback.seekThumbnail?.rowCount, 10);
    expect(playback.seekThumbnail?.columnCount, 10);
    expect(playback.seekThumbnail?.intervalMilliseconds, 2000);
    expect(playback.seekThumbnail?.thumbnailWidth, 320);
    expect(playback.seekThumbnail?.thumbnailHeight, 180);
    expect(playback.seekThumbnail?.allThumbnailCount, 77);
  });

  test('maps vod list dto into domain page', () {
    const dto = VodListDto(
      data: [
        VodDto(
          videoNo: 1,
          videoId: 'video',
          videoTitle: 'Video',
          videoType: 'REPLAY',
          publishDate: '2026-06-06',
          duration: 60,
          readCount: 20,
          publishDateAt: 123,
          userAdultStatus: 'ADULT',
          membershipBenefitType: 'MEMBER_ONLY',
        ),
      ],
      page: VodPageDto(
        next: VodPageNextDto(
          publishDateAt: 456,
          readCount: 10,
        ),
      ),
      size: 18,
    );

    final page = vodPageFromDto(dto);

    expect(page.size, 18);
    expect(page.items.single.videoNo, 1);
    expect(page.items.single.title, 'Video');
    expect(page.items.single.userAdultStatus, 'ADULT');
    expect(page.items.single.membershipBenefitType, 'MEMBER_ONLY');
    expect(page.cursor?.publishDateAt, 456);
    expect(page.cursor?.readCount, 10);
  });

  test('maps vod detail dto membership benefit type into domain detail', () {
    const dto = VodDetailDto(
      videoNo: 1,
      videoTitle: 'Video',
      videoType: 'REPLAY',
      publishDate: '2026-06-06',
      duration: 60,
      readCount: 20,
      publishDateAt: 123,
      adult: false,
      livePv: 0,
      videoChatEnabled: false,
      membershipBenefitType: 'MEMBER_ONLY',
    );

    final detail = vodDetailFromDto(dto);

    expect(detail.membershipBenefitType, 'MEMBER_ONLY');
  });
}
