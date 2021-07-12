import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinterest_clone/components/componets.dart';
import 'package:pinterest_clone/models/post.model.dart';

class HomeScreen extends StatefulWidget {
  final ScrollController _scrollControll;

  const HomeScreen({
    Key? key,
    required ScrollController scrollControll,
  })  : _scrollControll = scrollControll,
        super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _tabSeleted = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 9),
        child: CustomScrollView(
          controller: widget._scrollControll,
          physics: const BouncingScrollPhysics(),
          slivers: [
            // Appbar
            SliverAppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              automaticallyImplyLeading: false,
              pinned: true,
              actions: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 9),
                  width: MediaQuery.of(context).size.width - 18,
                  child: Row(
                    children: [
                      // All tab
                      InkWell(
                        onTap: () {
                          setState(() {
                            _tabSeleted == 0;
                          });
                        },
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color:
                                _tabSeleted == 0 ? Colors.black : Colors.white,
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 9),
                          child: Text(
                            "All",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: _tabSeleted == 0
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      // Idea tab
                      InkWell(
                        onTap: () {
                          setState(() {
                            _tabSeleted == 1;
                          });
                        },
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color:
                                _tabSeleted == 1 ? Colors.black : Colors.white,
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 9),
                          child: Text(
                            "Idea",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: _tabSeleted == 1
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Post list
            SliverStaggeredGrid.countBuilder(
              crossAxisCount: 4,
              itemCount: posts.length,
              itemBuilder: (context, index) => PostCard(
                image: posts[index].image,
                title: posts[index].title,
              ),
              crossAxisSpacing: 9,
              mainAxisSpacing: 9,
              staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
            ),
          ],
        ),
      ),
    );
  }
}
