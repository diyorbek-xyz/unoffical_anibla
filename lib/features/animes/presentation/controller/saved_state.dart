class SavedState {
  final bool isLoading;
  final bool hasError;
  final String error;
  const SavedState({this.error = "", this.hasError = false, this.isLoading = false});
}
