import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:money_controller/screens/home/widgets/graph_widget.dart';

class MonthWidget extends StatefulWidget {
  final List<QueryDocumentSnapshot> documents;
  final double total;
  final List<double> perDay;
  final Map<String, double> categories;

  MonthWidget({
    Key? key,
    required this.documents,
  })  : total = documents
            .map((doc) => doc['value'])
            .fold(0.0, (previousValue, element) => previousValue + element),
        perDay = List.generate(30, (int index) {
          return documents
              .where((doc) => doc['day'] == (index + 1))
              .map((doc) => doc['value'])
              .fold(0.0, (previousValue, element) => previousValue + element);
        }),
        categories = documents.fold({}, (Map<String, double> map, document) {
          if (!map.containsKey(document['category'])) {
            map[document['category']] = 0.0;
          }

          //TODO:  no es " = " es " += "
          map[document['category']] = document['value'] * 1.0;
          return map;
        }),
        super(key: key);

  @override
  State<MonthWidget> createState() => _MonthWidgetState();
}

class _MonthWidgetState extends State<MonthWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          _expensesCounter(),
          _graph(),
          Container(
            color: Colors.blueAccent.withOpacity(0.15),
            height: 24.0,
          ),
          _expensesList(),
        ],
      ),
    );
  }

  Widget _expensesCounter() {
    return Column(
      children: [
        Text(
          '\$${widget.total.toStringAsFixed(2)}',
          style: const TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          'Total expenses',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey,
          ),
        ),
      ],
    );
  }

  Widget _graph() {
    return SizedBox(
      height: 250,
      child: GraphWidget(
        data: widget.perDay,
      ),
    );
  }

  Widget _item(IconData icon, String name, int percent, double value) {
    return ListTile(
      leading: Icon(icon, size: 32.0),
      title: Text(
        name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
      subtitle: Text(
        '$percent% of expenses',
        style: const TextStyle(
          fontSize: 16.0,
          color: Colors.blueGrey,
        ),
      ),
      trailing: Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent.withOpacity(0.2),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '\$$value',
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.blueAccent,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _expensesList() {
    return Expanded(
      child: ListView.separated(
        itemCount: widget.categories.keys.length,
        itemBuilder: (context, index) {
          var key = widget.categories.keys.elementAt(index);
          var data = double.parse(widget.categories[key].toString());

          return _item(
            FontAwesomeIcons.cartShopping,
            key,
            100 * data ~/ widget.total,
            data,
          );
        },
        separatorBuilder: (BuildContext context, index) {
          return Container(
            color: Colors.blueAccent.withOpacity(0.15),
            height: 8.0,
          );
        },
      ),
    );
  }
}
