
import 'package:flutter/material.dart';
import 'package:testapp/pages/orders.dart';

class Home extends StatefulWidget {
  final String username;
  const Home({Key? key, required this.username}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Business"),
          bottom: TabBar(
            tabs: [
              Tab(text: "orders"),
              Tab(text: "Preparing")
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              SizedBox(
                height: 60,
                child: DrawerHeader(
                    child: Text(
                  "${widget.username}",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                )),
              ),
              ListTile(
                leading: Icon(Icons.add_business),
                title: Text("past orders"),
              ),
              ListTile(
                leading: Icon(Icons.auto_graph),
                title: Text("analytics"),
              ),
              ListTile(
                leading: Icon(Icons.monetization_on_outlined),
                title: Text("Earnings"),
              ),


              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
              ),
            ],
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: const TabBarView(
        children: [
          Orders(),
        Icon(Icons.music_video),

        ],
      ),
        ),
      ),
    );
  }
}
