import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_controller/screens/addings/widgets/category_selection_widget.dart';

class AddingPage extends StatefulWidget {
  const AddingPage({super.key});

  @override
  State<AddingPage> createState() => _AddingPageState();
}

class _AddingPageState extends State<AddingPage> {
  String category = '';
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: false,
        title: const Text(
          'Category',
          style: TextStyle(
            color: Colors.blueGrey,
            fontStyle: FontStyle.italic,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close, color: Colors.grey),
          ),
        ],
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        _categorySelector(),
        _currentValue(),
        _numpad(),
        _submit(),
      ],
    );
  }

  Widget _categorySelector() {
    return SizedBox(
      height: 80.0,
      child: CategorySelectionWidget(
        categories: const {
          'Shopping': Icons.shopping_cart,
          'Groceries': FontAwesomeIcons.utensils,
          'Fast Food': FontAwesomeIcons.burger,
          'Bills': FontAwesomeIcons.wallet,
          'Alcohol': FontAwesomeIcons.beerMugEmpty,
        },
        onValueChanged: (newCategory) => category = newCategory,
      ),
    );
  }

  Widget _currentValue() {
    var realValue = value / 100;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Text(
        '\$${realValue.toStringAsFixed(2)}',
        style: const TextStyle(
          fontSize: 50.0,
          color: Colors.blueAccent,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _num(String text, double height) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        (text == ',')
            ? value = value * 100
            : value = value * 10 + int.parse(text);
        setState(() {});
      },
      child: SizedBox(
        height: height,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 40.0,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  Widget _numpad() {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          var fixedHeight = constraints.biggest.height / 4;
          return Table(
            border: TableBorder.all(
              color: Colors.grey,
              width: 1.0,
            ),
            children: [
              TableRow(
                children: [
                  _num('1', fixedHeight),
                  _num('2', fixedHeight),
                  _num('3', fixedHeight),
                ],
              ),
              TableRow(
                children: [
                  _num('4', fixedHeight),
                  _num('5', fixedHeight),
                  _num('6', fixedHeight),
                ],
              ),
              TableRow(
                children: [
                  _num('7', fixedHeight),
                  _num('8', fixedHeight),
                  _num('9', fixedHeight),
                ],
              ),
              TableRow(
                children: [
                  _num('.', fixedHeight),
                  _num('0', fixedHeight),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      value = value ~/ 10;
                      setState(() {});
                    },
                    child: SizedBox(
                      height: fixedHeight,
                      child: const Icon(
                        Icons.backspace_outlined,
                        color: Colors.grey,
                        size: 35.0,
                      ),
                    ),
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _submit() {
    return Builder(
      builder: (context) {
        return Container(
          width: double.infinity,
          height: 60,
          decoration: const BoxDecoration(color: Colors.blue),
          child: MaterialButton(
            child: const Text(
              'Add expense',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            onPressed: () {
              if (value != 0 && category != '') {
                FirebaseFirestore.instance.collection('expenses').doc().set({
                  'category': category,
                  'value': value,
                  'month': DateTime.now().month,
                  'day': DateTime.now().day,
                });
                Navigator.pop(context);
              } else {
                Scaffold.of(context).showBottomSheet(
                  (context) => const Text('Select a value and category'),
                );
              }
            },
          ),
        );
      },
    );
  }
}
