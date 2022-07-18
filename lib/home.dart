import 'package:flutter/material.dart';
import 'package:scroll_problem/top.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Problem'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TopWidget(),
            TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                    icon: Icon(
                      Icons.contacts,
                      color: Colors.red,
                    ),
                    text: "Tab 1"),
                Tab(
                  icon: Icon(Icons.camera_alt, color: Colors.red),
                  text: "Tab 2",
                ),
                Tab(
                    icon: Icon(Icons.camera_alt, color: Colors.red),
                    text: "Tab 3")
              ],
            ),
            SizedBox(
                height: 400,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Container(
                      color: Colors.green,
                      child: Center(
                        child: Text('First tab content with 100 height'),
                      ),
                    ),
                    Container(
                      color: Colors.red,
                      child: Center(
                        child: Text('Second tab content with 200 height'),
                      ),
                    ),
                    Container(
                      color: Colors.blue,
                      child: Center(
                        child: Text('Thired tab content with 200 height'),
                      ),
                    ),
                  ],
                )),
            for (int i = 0; i < 2; i++) ...{TopWidget()},
          ],
        ),
      ),
    );
  }
}
