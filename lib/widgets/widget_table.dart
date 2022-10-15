import 'package:flutter/material.dart';

class TableWidget extends StatefulWidget {
  const TableWidget({super.key});

  @override
  State<TableWidget> createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  List<Map> tableData = [];
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 10; i++) {
      tableData.add({
        "name": 'w' * i + i.toString(),
        "age": i + 10,
        "sex": i.isEven ? "男" : "女",
        "select": false,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Table && DataTable'),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Table:'),
            Table(
              border: TableBorder.all(
                color: Colors.grey,
              ),
              children: tableData
                  .map((e) => TableRow(children: [
                        Text(e["name"]),
                        Text(e["sex"]),
                      ]))
                  .toList(),
            ),
            const Divider(
              height: 20,
            ),
            const Text('DataTable:'),
            DataTable(
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              columns: [
                DataColumn(
                  label: const Text('姓名'),
                  onSort: (columnIndex, ascending) {
                    setState(() {
                      _sortColumnIndex = columnIndex;
                      _sortAscending = ascending;
                      tableData.sort((a, b) {
                        if (!ascending) {
                          var c = a;
                          a = b;
                          b = c;
                        }
                        return a['name']
                            .toString()
                            .length
                            .compareTo(b['name'].toString().length);
                      });
                    });
                  },
                ),
                DataColumn(
                  label: const Text('年龄'),
                  onSort: (columnIndex, ascending) {
                    setState(() {
                      _sortColumnIndex = columnIndex;
                      _sortAscending = ascending;
                      tableData.sort((a, b) {
                        if (!ascending) {
                          var c = a;
                          a = b;
                          b = c;
                        }
                        return a['age'].compareTo(b['age']);
                      });
                    });
                  },
                ),
                const DataColumn(label: Text('性别')),
              ],
              rows: tableData
                  .map((e) => DataRow(
                        selected: e['select'],
                        onSelectChanged: (value) {
                          if (value != e['select']) {
                            setState(() {
                              e['select'] = value;
                            });
                          }
                        },
                        cells: [
                          DataCell(Text(e['name'])),
                          DataCell(Text(e['age'].toString())),
                          DataCell(Text(e['sex'])),
                        ],
                      ))
                  .toList(),
            )
          ],
        ),
      )),
    );
  }
}
