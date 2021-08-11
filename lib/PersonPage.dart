import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'main_page.dart';

class PersonImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageControlNotifier>(
      builder: (context, notifier, child) {
        //print(MediaQuery.of(context).size.width);
        //print(notifier._offset);
        return Positioned(
            left: -0.85 * notifier.offset,
            width: MediaQuery.of(context).size.width * 0.9,
            child: child);
      },
      child: IgnorePointer(

          child: SvgPicture.asset("assets/icons/trav.svg")),
    );
  }
}

class PreviewText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Consumer<PageControlNotifier>(
      builder: (context, notifier, child) {
        return Transform.translate(
          offset: Offset(-40 -0.5 * notifier.offset, 0),
          child: child,
        );
      },

        child: RotatedBox(
          quarterTurns: 1,
          child: SizedBox(
            width: 400,
            child: FittedBox(
              alignment: Alignment.topCenter,
              fit: BoxFit.cover,
              child: Text(
                "88",
                style: TextStyle(fontSize: 400, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),

    );
  }
}
class PersonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 200,
        ),
        PreviewText(),
        SizedBox(
          height: 350,
        ),
        PersonDescriptionText()
      ],
    );
  }
}


class PersonDescriptionText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(left: 22),
      child: Container(
        child
            : Text(
          "Hello and Welcome to a All new Travel Experience, ",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
