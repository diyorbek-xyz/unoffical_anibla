import 'package:flutter/material.dart';

sealed class MediaInfoEntry {
  const MediaInfoEntry();
}

final class Single extends MediaInfoEntry {
  final String label;
  final String value;
  const Single(this.label, this.value);
}

final class MultiActions extends MediaInfoEntry {
  final String label;
  final List<String> value;
  final bool isFilled;
  const MultiActions(this.label, this.value, [this.isFilled = false]);
}

final class Multi extends MediaInfoEntry {
  final String label;
  final List<Widget> children;
  const Multi(this.label, this.children);
}

final class Custom extends MediaInfoEntry {
  final String label;
  final Widget child;
  const Custom(this.label, this.child);
}
