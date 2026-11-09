import 'package:application/features/anibla/data/models/data/history_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_response.g.dart';
part 'history_response.freezed.dart';

@freezed
abstract class HistoryResponse with _$HistoryResponse {
  const factory HistoryResponse({
    @Default([]) List<HistoryItem> items,
    @Default("") @JsonKey(name: "next_cursor") String nextCursor,
    @Default("") @JsonKey(name: "server_time") String serverTime,
  }) = _HistoryResponse;
  factory HistoryResponse.fromJson(Map<String, dynamic> json) => _$HistoryResponseFromJson(json);
}
