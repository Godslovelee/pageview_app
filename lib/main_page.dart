import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:profilescreen_ui/PersonPage.dart';
import 'dart:math' as math;
import 'colors.dart';
import 'dart:math';

class PageControlNotifier extends ChangeNotifier {
  double _offset;
  double _page = 0;
  PageControlNotifier(PageController _pageController) {
    _pageController.addListener(() {
      _offset = _pageController.offset;

      notifyListeners();
    });
  }

  double get page => _page;
  double get offset => _offset;
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PageControlNotifier(_pageController),
      child: Scaffold(
          body: SafeArea(
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            PageView(
              physics: ClampingScrollPhysics(),
              controller: _pageController,
              children: [
                PersonPage(), GlobePage()],
            ),
            AppBar(),
            PersonImage(),
            GlobeImage(),
            ShareButton(),
            PageIndicator(),
            ArrowIcon(),

            //PreviewText(),
            //PositionGlobeImage(),
          ],
        ),
      )),
    );
  }
}

class AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Text(
                "TR",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Icon(Icons.menu)
            ],
          ),
        ));
  }
}




class ShareButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Positioned(
       right:24 ,
        bottom: 16,
        child: Icon(Icons.share));
  }
}

class GlobePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container();
  }
}



class GlobeImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageControlNotifier>(
      builder: (context, notifier, child) {
        return Positioned(
            left: 1.2 * MediaQuery.of(context).size.width - 1.23 * notifier.offset,
            child: child);
      },
      child: IgnorePointer(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 90.0),
          child: SvgPicture.asset(
            "assets/icons/earth.svg",
            height: MediaQuery.of(context).size.height / 1.5,
          ),
        ),
      ),
    );
  }
}
class PageIndicator extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Consumer<PageControlNotifier>(
        builder: (context, notifier, _) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: notifier.page.round() == 0 ? white : lightGrey,
                    ),
                    height: 6,
                    width: 6,
                  ),
                  SizedBox(width: 8),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: notifier.page.round() != 0 ? white : lightGrey,
                    ),
                    height: 6,
                    width: 6,
                  ),
                ],
              ),
            ),
          );
        },

    );
  }
}


class ArrowIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

        return Positioned(
          top: 120.0 + 400 + 32 - 4,
          right: 24,
          child: Icon(
          Icons.keyboard_arrow_up,
          size: 28,
          color: lighterGrey,
        ),

    );
  }

}




