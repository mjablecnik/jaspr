import 'package:flutter/widgets.dart' show Widget;
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_flutter_embed/jaspr_flutter_embed.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';

import '../providers/effects_provider.dart';

class FlutterTarget extends StatelessComponent {
  const FlutterTarget({required this.app, this.loader, Key? key}) : super(key: key);

  final Widget app;
  final Component? loader;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    var effects = context.watch(effectsProvider);
    var rotation = context.watch(rotationProvider);

    var isHandheld = effects.contains('handheld');

    Component child = FlutterEmbedView(
      key: GlobalObjectKey('flutter_target'),
      classes: isHandheld ? ['handheld'] : effects.toList(),
      styles: rotation != 0
          ? Styles.box(
              transform: Transform.combine([
                Transform.perspective(1000.px),
                Transform.rotateAxis(y: rotation.deg),
              ]),
            )
          : null,
      loader: loader,
      app: app,
    );

    if (isHandheld) {
      child = div(id: 'handheld', [
        child,
        span(classes: [
          'imageAttribution'
        ], [
          text('Photo by '),
          a(
            href: 'https://unsplash.com/photos/x9WGMWwp1NM',
            target: Target.blank,
            attributes: {'rel': 'noopener noreferrer'},
            [text('Nathana Rebouças')],
          ),
          text(' on Unsplash'),
        ]),
      ]);
    }

    yield article([child]);
  }
}
