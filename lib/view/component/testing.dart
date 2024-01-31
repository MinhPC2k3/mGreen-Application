import 'package:flutter/material.dart';
class Testing extends StatefulWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener((){
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // SliverAppBar(
          //
          // )
          SliverAppBar(
            elevation: 0,
            expandedHeight: 360,
            floating: false,
            pinned: true,
            snap: false,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              stretchModes: const [StretchMode.zoomBackground],
              title: const Text('running running'),
              background: Image.asset(
                'assets/images/user-logo.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((_, i) {
              return ListTile(title: Text("Item $i"));
            }, childCount: 20),
          ),
        ],
      ),
    );
  }
}