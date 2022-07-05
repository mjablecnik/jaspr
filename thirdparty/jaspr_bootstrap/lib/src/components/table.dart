import 'package:jaspr/jaspr.dart';
import 'package:jaspr/ui.dart';

import 'base.dart';

enum TableType {
  primary,
  secondary,
  success,
  danger,
  warning,
  info,
  light,
  dark,
  striped,
  hover,
}

class Table extends BaseComponent {
  final TableRow head;
  final List<TableRow> body;
  final TableRow? footer;
  final TableType? type;
  final Text? caption;

  Table({
    required this.head,
    required this.body,
    this.caption,
    this.type,
    this.footer,
    super.id,
    super.key,
    super.child,
    super.children,
    super.style,
    super.classes,
    super.attributes,
    super.events,
    super.backgroundColor,
    super.textColor,
    super.padding,
    super.margin,
    super.border,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DivElement(
      style: style,
      events: events,
      classes: [
        'table',
        if (type != null) 'table-${type!.name}',
        ...getClasses(classes),
      ],
      children: [
        if (caption != null) DomComponent(tag: 'caption', child: caption),
        DomComponent(tag: 'thead', child: head),
        DomComponent(tag: 'tbody', children: body),
        if (footer != null) DomComponent(tag: 'tfoot', child: footer),
      ],
    );
  }
}

enum Cell { th, td }

class TableCell extends BaseComponent {
  final String text;
  final Cell cell;
  final TableType? type;

  TableCell({
    required this.text,
    required this.cell,
    this.type,
    super.classes,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DomComponent(
      tag: cell.name,
      classes: [
        if (type != null) 'table-${type!.name}',
        ...getClasses(classes),
      ],
      child: Text(text),
    );
  }
}

class TableRow extends BaseComponent {
  final List<TableCell> cells;
  final TableType? type;

  TableRow({
    required this.cells,
    this.type,
    super.style,
    super.classes,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DomComponent(
      tag: 'tr',
      classes: [
        if (type != null) 'table-${type!.name}',
        ...getClasses(classes),
      ],
      children: cells,
    );
  }
}
