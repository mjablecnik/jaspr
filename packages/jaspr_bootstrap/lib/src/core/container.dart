import 'package:jaspr/jaspr.dart';
import 'package:jaspr_bootstrap/src/border.dart';
import 'package:jaspr_bootstrap/src/edge_insets.dart';
import 'package:jaspr_bootstrap/src/enums.dart';

class Container extends StatelessComponent {
  final Breakpoint breakpoint;
  final BackgroundColor? backgroundColor;
  final TextColor? textColor;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Border? border;

  final Component? _child;
  final List<Component>? _children;

  Container({
    Key? key,
    Component? child,
    List<Component>? children,
    this.breakpoint = Breakpoint.extraSmall,
    this.backgroundColor,
    this.textColor,
    this.padding,
    this.margin,
    this.border,
  })  : _child = child,
        _children = children,
        super(key: key);

  List<Component> get children => [if (_child != null) _child!, ..._children ?? []];

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DomComponent(
      tag: 'div',
      classes: [
        'container${breakpoint.value}',
        if (backgroundColor != null) backgroundColor!.value,
        if (textColor != null) textColor!.value,
        if (padding != null) ...padding!.getClasses('p'),
        if (margin != null) ...margin!.getClasses('m'),
        if (border != null) ...border!.getClasses(),
      ],
      children: children,
    );
  }
}
