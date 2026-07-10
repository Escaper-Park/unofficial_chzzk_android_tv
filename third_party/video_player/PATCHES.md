# Local patches

This directory contains the minimum runtime files from Flutter's
`video_player` package version 2.11.1. The upstream source was obtained from
pub.dev package SHA-256
`48a7bdaa38a3d50ec10c78627abdbfad863fdf6f0d6e08c7c3c040cfd80ae36f`.
The original BSD 3-Clause `LICENSE` and `AUTHORS` files are included unchanged.

## Single-flight position polling

File: `lib/video_player.dart`

The upstream controller starts a 100 ms periodic timer whose callback awaits
`VideoPlayerPlatform.getPosition`. Because periodic timer callbacks do not wait
for prior callbacks, a blocked platform thread can accumulate overlapping
position requests.

The local patch skips a tick while one position request is still pending. The
guard is released in `finally`, and a failed sample is ignored so the next
timer tick can retry without producing an unhandled asynchronous error.
Player-level errors continue to arrive through the platform event stream. A
result received after controller disposal is ignored.

Controllers also expose nullable `positionUpdateInterval`, defaulting to the
upstream 100 ms cadence. Live and live-preview playback pass `null` because
they do not render a seek position; this disables polling entirely while
leaving event-driven buffering, completion, error, rotation, and size updates
unchanged. VOD keeps the upstream cadence.

## Bounded, idempotent controller cleanup

File: `lib/video_player.dart`

Creation completion is published from `finally`, including platform creation
failures. Disposal removes the lifecycle observer and position timer
synchronously, returns the same Future to repeated callers, disposes a late
created native player exactly once, and handles non-`PlatformException` stream
errors without unsafe casts or null assertions. A short barrier prevents a
stalled create from blocking cleanup forever. Platform subscription/player
cleanup remains represented by the returned Future so the app-level disposal
coordinator can serialize scarce decoder and surface resources with its own
timeout.

The play path checks disposal again after the asynchronous platform `play`
call. This prevents a late play completion from recreating the periodic VOD
position timer after disposal.

When updating the vendored package:

1. Replace `lib/`, `pubspec.yaml`, `LICENSE`, and `AUTHORS` with the new upstream
   release.
2. Reapply the `_isPollingPosition` guard, `_pollPosition` helper, nullable
   `positionUpdateInterval`, and initialize/dispose/error-state changes above.
3. Update the version and source SHA-256 above.
4. Run `flutter test test/src/core/video_player_position_polling_test.dart`.
