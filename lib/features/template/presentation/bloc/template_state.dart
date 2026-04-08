sealed class TemplateState {
  const TemplateState();
}

final class TemplateInitial extends TemplateState {
  const TemplateInitial();
}

final class TemplateLoading extends TemplateState {
  const TemplateLoading();
}

final class TemplateSuccess extends TemplateState {
  final dynamic data;
  const TemplateSuccess(this.data);
}

final class TemplateError extends TemplateState {
  final String message;
  const TemplateError(this.message);
}
