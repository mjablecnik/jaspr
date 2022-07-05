import 'package:jaspr_bootstrap/components.dart';
import 'package:jaspr/jaspr.dart';

final List<String> headers = ["header 1", "header 2", "header 3", "header 4"];
final List<List<String>> bodyData = [
  ['1', '2', '3', '4'],
  ['5', '6', '7', '8'],
  ['9', '10', '11', '12'],
  ['13', '14', '16', '32'],
];

class TablePage extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield Table(
      head: TableRow(
        cells: headers
            .map((e) => TableCell(
                  text: e,
                  cell: Cell.th,
                ))
            .toList(),
      ),
      body: bodyData
          .map((e) => TableRow(
                cells: e
                    .map((e) => TableCell(
                          text: e,
                          cell: Cell.td,
                        ))
                    .toList(),
              ))
          .toList(),
    );
  }
}
