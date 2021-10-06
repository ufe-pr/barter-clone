import 'package:flutter/material.dart';

class DashboardCardsView extends StatefulWidget {
  @override
  _DashboardCardsViewState createState() => _DashboardCardsViewState();
}

class _DashboardCardsViewState extends State<DashboardCardsView> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          actions: [
            Center(
              child: FlatButton.icon(
                height: 30,
                color: Colors.teal.shade100,
                icon: Icon(Icons.add, color: Colors.teal.shade800, size: 16),
                label: Text(
                  "New Card",
                  style: TextStyle(
                    color: Colors.teal.shade800,
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
                onPressed: () {},
                minWidth: 20,
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
        SliverPadding(
          padding: const EdgeInsets.all(20.0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) =>
                  index.isEven ? VirtualCard() : SizedBox(height: 20),
              childCount: 3,
            ),
          ),
        ),
      ],
    );
  }
}

class VirtualCard extends StatelessWidget {
  final String? cardNumber;
  final String? fullName;
  final String? date;

  const VirtualCard({Key? key, this.cardNumber, this.fullName, this.date})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: DefaultTextStyle.merge(
            style: TextStyle(color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "iTunes",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      "\$10.32",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                DefaultTextStyle.merge(
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "monospace",
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("4288"),
                      Text("4288"),
                      Text("4288"),
                      Text("4288"),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "VALID\nTILL",
                              style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "10/24",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "UFEDOJO ATABO",
                          style: TextStyle(
                            fontFamily: "monospace",
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "VISA",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
