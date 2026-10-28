import 'package:application/shared/utils/url_launcher.dart';
import 'package:flutter/material.dart';

class Html {
  static Text htmlBuilder(String text) => Text.rich(
    TextSpan(
      children: htmlTextExtractor(text).map((e) {
        final text = e['text'];
        final isLink = e['tag'] == 'a';
        final link = e['attributes']['href']?.toString();
        if (isLink) {
          return WidgetSpan(
            child: InkWell(onTap: () => openLink(link ?? ""), child: Text(text)),
          );
        }
        return TextSpan(text: text);
      }).toList(),
    ),
  );

  static List<Map<String, dynamic>> htmlTextExtractor(String html) {
    final result = <Map<String, dynamic>>[];

    // tag | text chunk | stray "<" treated as text
    final tokenRe = RegExp(r'<(/?)([a-zA-Z][\w:-]*)([^>]*?)(/?)>|([^<]+|<)');
    final attrRe = RegExp(r'''([\w:-]+)\s*(?:=\s*(?:"([^"]*)"|'([^']*)'|([^\s"'>]+)))?''');
    final wsRe = RegExp(r'\s+');

    const voidTags = {'br', 'hr', 'img', 'input', 'meta', 'link', 'area', 'base', 'col', 'embed', 'source', 'track', 'wbr'};

    final stack = <Map<String, dynamic>>[];
    final buffer = StringBuffer();

    void flush() {
      final clean = buffer.toString().replaceAll(wsRe, ' ').trim();
      buffer.clear();
      if (clean.isEmpty) return;
      final parent = stack.isNotEmpty ? stack.last : null;
      result.add({'text': clean, 'tag': parent?['tag'], 'attributes': parent?['attributes'] ?? <String, String>{}});
    }

    for (final m in tokenRe.allMatches(html)) {
      final text = m.group(5);
      if (text != null) {
        buffer.write(text);
        continue;
      }

      flush(); // emit pending text with the CURRENT parent before the stack changes

      final isClosing = m.group(1) == '/';
      final tag = m.group(2)!.toLowerCase();
      final selfClosing = m.group(4) == '/';

      if (isClosing) {
        final i = stack.lastIndexWhere((e) => e['tag'] == tag);
        if (i != -1) stack.removeRange(i, stack.length);
        continue;
      }

      if (selfClosing || voidTags.contains(tag)) continue;

      final attributes = <String, String>{
        for (final a in attrRe.allMatches(m.group(3) ?? '')) a.group(1)!: a.group(2) ?? a.group(3) ?? a.group(4) ?? '',
      };

      stack.add({'tag': tag, 'attributes': attributes});
    }

    flush(); // trailing text
    return result;
  }
}
