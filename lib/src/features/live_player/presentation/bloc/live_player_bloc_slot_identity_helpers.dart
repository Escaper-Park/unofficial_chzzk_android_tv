part of 'live_player_bloc.dart';

extension _LivePlayerBlocSlotIdentityHelpers on LivePlayerBloc {
  void _retainSlotSerials(Set<String> slotIds) {
    _slotTargetRequestSerials.removeWhere(
      (slotId, _) => !slotIds.contains(slotId),
    );
    _slotStatusRefreshSerials.removeWhere(
      (slotId, _) => !slotIds.contains(slotId),
    );
    _slotStatusRefreshesInFlight.removeWhere(
      (slotId, _) => !slotIds.contains(slotId),
    );
    _endedStatusChecks.retainSlotIds(slotIds);
  }

  int _nextSlotStatusRefreshSerial(String slotId) {
    final next = (_slotStatusRefreshSerials[slotId] ?? 0) + 1;
    _slotStatusRefreshSerials[slotId] = next;
    return next;
  }

  int _nextSlotTargetRequestSerial(String slotId) {
    final next = (_slotTargetRequestSerials[slotId] ?? 0) + 1;
    _slotTargetRequestSerials[slotId] = next;
    return next;
  }

  bool _isSlotTargetRequestCurrent(String slotId, int requestSerial) {
    return _slotTargetRequestSerials[slotId] == requestSerial;
  }

  String _nextGeneratedSlotId() {
    while (true) {
      final slotId = 'slot-${_generatedSlotSerial++}';
      if (state.slotById(slotId) == null) {
        return slotId;
      }
    }
  }
}
