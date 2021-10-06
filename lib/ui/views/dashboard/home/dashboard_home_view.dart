import 'package:flutter/material.dart';

class DashboardHomeView extends StatefulWidget {
  @override
  _DashboardHomeViewState createState() => _DashboardHomeViewState();
}

class _DashboardHomeViewState extends State<DashboardHomeView> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          // floating: true,
          iconTheme: IconThemeData(color: Colors.grey),
          actions: [
            IconButton(
              iconSize: 32,
              icon: Icon(Icons.settings_outlined),
              onPressed: () {},
            ),
            VerticalDivider(indent: 15, endIndent: 15, color: Colors.black),
            IconButton(
              iconSize: 32,
              icon: Icon(Icons.notifications_rounded),
              onPressed: () {},
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(150),
            child: SizedBox(
              height: 150,
              child: ButtonTheme(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                buttonColor: Colors.brown.shade300.withOpacity(.5),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  color: Colors.orangeAccent.shade100,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text.rich(TextSpan(
                              text: "₦ 200.",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w700,
                              ),
                              children: [
                                TextSpan(
                                  text: "99",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            )),
                            FlatButton.icon(
                              icon: Icon(Icons.visibility_off, size: 20),
                              label: Container(),
                              onPressed: () {},
                              minWidth: 20,
                            ),
                            Spacer(),
                            RaisedButton.icon(
                              elevation: 0,
                              label: Text("NGN"),
                              onPressed: () {},
                              icon: Icon(Icons.keyboard_arrow_down_rounded),
                            ),
                          ],
                        ),
                        Spacer(),
                        RaisedButton(
                          elevation: 0,
                          child: Text("Add money"),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(20.0),
          sliver: SliverGrid.count(
            crossAxisCount: 2,
            childAspectRatio: 16 / 11,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            children: [
              GridTile(
                label: "Request Money",
                icon: Icon(Icons.house),
                color: Colors.pink.shade100,
              ),
              GridTile(
                label: "Send Money",
                icon: Icon(Icons.house),
                color: Colors.amber.shade100,
              ),
              GridTile(
                label: "Buy Airtime",
                icon: Icon(Icons.house),
                color: Colors.green.shade50,
              ),
              GridTile(
                label: "Pay Bills",
                icon: Icon(Icons.house),
                color: Colors.blue.shade50,
              ),
            ],
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20) +
              const EdgeInsets.only(bottom: 30),
          sliver: SliverToBoxAdapter(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              color: Colors.indigo.shade400,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 40,
                ),
                child: Center(
                  child: Text(
                    "Send a redeemable gift card to family & friends anywhere in the world.",
                    style: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class GridTile extends StatelessWidget {
  final String label;
  final Color color;
  final Widget icon;

  const GridTile({Key key, this.label, this.color, this.icon})
      : assert(icon != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: color ?? Colors.orangeAccent.shade100,
      elevation: 0,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              child: icon,
              backgroundColor: Colors.white,
            ),
            Spacer(),
            Text(
              label,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
