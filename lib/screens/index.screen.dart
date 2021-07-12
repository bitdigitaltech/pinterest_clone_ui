import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pinterest_clone/screens/home.screen.dart';
import 'package:pinterest_clone/screens/screens.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  ScrollController scrollController = ScrollController();

  var _screenIndex = 0;
  var _isVisible;

  void scrolling() {
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (_isVisible) {
        setState(() {
          _isVisible = false;
        });
      }
    }
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (!_isVisible) {
        setState(() {
          _isVisible = true;
        });
      }
    }
  }

  void scrollingToTop() {
    scrollController.animateTo(
      0,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    _isVisible = true;
    scrollController.addListener(scrolling);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Screens
            _screenIndex == 0
                ? HomeScreen(scrollControll: scrollController)
                : (_screenIndex == 1
                    ? SearchScreen()
                    : (_screenIndex == 2 ? MessageScreen() : MeScreen())),
            // Bottom navigation
            AnimatedPositioned(
              bottom: _isVisible == false ? -100 : 0,
              left: 0,
              right: 0,
              duration: const Duration(milliseconds: 400),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 280,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.20),
                        spreadRadius: 5,
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  margin: const EdgeInsets.all(18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _screenIndex = 0;
                          });
                          scrollingToTop();
                        },
                        child: Icon(
                          Icons.home_filled,
                          color: _screenIndex == 0 ? Colors.black : Colors.grey,
                          size: 30,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _screenIndex = 1;
                          });
                          scrollingToTop();
                        },
                        child: Icon(
                          Icons.search_rounded,
                          color: _screenIndex == 1 ? Colors.black : Colors.grey,
                          size: 32,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _screenIndex = 2;
                          });
                          scrollingToTop();
                        },
                        child: Icon(
                          Icons.message,
                          color: _screenIndex == 2 ? Colors.black : Colors.grey,
                          size: 30,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _screenIndex = 3;
                          });
                          scrollingToTop();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: _screenIndex == 3
                                ? Border.all(width: 2, color: Colors.black)
                                : null,
                          ),
                          child: const CircleAvatar(
                            radius: 14,
                            backgroundImage: NetworkImage("url"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
