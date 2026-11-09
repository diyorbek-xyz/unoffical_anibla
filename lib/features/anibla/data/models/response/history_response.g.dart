// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HistoryResponse _$HistoryResponseFromJson(Map<String, dynamic> json) =>
    _HistoryResponse(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => HistoryItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      nextCursor: json['next_cursor'] as String? ?? "",
      serverTime: json['server_time'] as String? ?? "",
    );

Map<String, dynamic> _$HistoryResponseToJson(_HistoryResponse instance) =>
    <String, dynamic>{
      'items': instance.items,
      'next_cursor': instance.nextCursor,
      'server_time': instance.serverTime,
    };
