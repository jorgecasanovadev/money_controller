import 'dart:async';

import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_controller/screens/home/widgets/month_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  int currentPage = 9;
  late Stream<QuerySnapshot> _query;

  @override
  void initState() {
    super.initState();

    _query = FirebaseFirestore.instance
        .collection('expenses')
        .where("month", isEqualTo: currentPage + 1)
        .snapshots();

    _pageController = PageController(
      initialPage: currentPage,
      viewportFraction: 0.3,
    );
  }

  Widget _bottomAction({IconData? icon}) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Icon(icon),
      ),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8.0,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _bottomAction(icon: FontAwesomeIcons.clockRotateLeft),
            _bottomAction(icon: FontAwesomeIcons.chartPie),
            const SizedBox(width: 48.0),
            _bottomAction(icon: FontAwesomeIcons.wallet),
            _bottomAction(icon: Icons.settings),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
      child: Column(
        children: [
          _selector(),
          StreamBuilder<QuerySnapshot>(
            stream: _query,
            builder: (context, data) {
              if (data.hasData) {
                return MonthWidget(
                  documents: data.data?.docs ?? [],
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _pageItem(String name, int position) {
    Alignment aligment;

    const selected = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.blueGrey,
    );

    final unselected = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.normal,
      color: Colors.blueGrey.withOpacity(0.4),
    );

    if (position == currentPage) {
      aligment = Alignment.center;
    } else if (position > currentPage) {
      aligment = Alignment.centerRight;
    } else {
      aligment = Alignment.centerLeft;
    }

    return Align(
      alignment: aligment,
      child: Text(
        name,
        style: position == currentPage ? selected : unselected,
      ),
    );
  }

  Widget _selector() {
    return SizedBox.fromSize(
      size: const Size.fromHeight(50.0),
      child: PageView(
        onPageChanged: (newPage) {
          currentPage = newPage;
          _query = FirebaseFirestore.instance
              .collection('expenses')
              .where("month", isEqualTo: currentPage + 1)
              .snapshots();
          setState(() {});
        },
        controller: _pageController,
        children: [
          _pageItem('Enero', 0),
          _pageItem('Febrero', 1),
          _pageItem('Marzo', 2),
          _pageItem('Abril', 3),
          _pageItem('Mayo', 4),
          _pageItem('Junio', 5),
          _pageItem('Julio', 6),
          _pageItem('Agosto', 7),
          _pageItem('Septiembre', 8),
          _pageItem('Octubre', 9),
          _pageItem('Noviembre', 10),
          _pageItem('Diciembre', 11),
        ],
      ),
    );
  }
}
