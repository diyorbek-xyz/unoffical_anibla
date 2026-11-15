import 'package:material_ui/material_ui.dart';

class Provider<T> extends InheritedWidget {
  final T value;
  const Provider({super.key, required this.value, super.child = const SizedBox.shrink()});

  static T of<T>(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<Provider<T>>();
    assert(provider != null, 'No Provider<$T> found in context');
    return provider!.value;
  }

  Provider<T> copyWithChild(Widget newChild) {
    return Provider<T>(key: key, value: value, child: newChild);
  }

  static Widget multi({required List<Provider<dynamic>> providers, required Widget child}) {
    return providers.reversed.fold<Widget>(child, (previousChild, provider) => provider.copyWithChild(previousChild));
  }

  @override
  bool updateShouldNotify(covariant Provider<T> oldWidget) {
    return oldWidget.value != value;
  }
}
