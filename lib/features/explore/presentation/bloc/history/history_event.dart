sealed class HistoryEvent {
  const HistoryEvent();
}

final class GetHistory extends HistoryEvent {
  const GetHistory();
}

final class DeleteFromHistory extends HistoryEvent {
  final String id;
  const DeleteFromHistory(this.id);
}

final class ClearHistory extends HistoryEvent {
  const ClearHistory();
}
