import 'package:Apps/common/responsive.dart';
import 'package:flutter/material.dart';

class Tabbar extends StatefulWidget {
  final double tabbarHeight;
  final Widget leading;
  final List<Widget> actions;
  final Widget title;
  final List<BoxShadow> boxShadow;
  final bool automaticallyLeading;
  final bool centerTitle;

  Tabbar({
    this.tabbarHeight,
    this.leading,
    this.actions,
    this.title,
    this.automaticallyLeading = true,
    this.centerTitle = true,
    this.boxShadow = const [
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.2),
        offset: Offset(0, 2),
        blurRadius: 1,
      ),
    ],
  });

  @override
  _TabbarState createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  @override
  build(BuildContext ctx) {
    final ModalRoute<dynamic> parentRoute = ModalRoute.of(ctx);
    final bool canPop = parentRoute?.canPop ?? false;
    final double tabbarHeight = widget.tabbarHeight ?? kToolbarHeight;

    Widget title = widget.title;
    Widget leading = widget.leading;
    List<Widget> actions = widget.actions;

    // leading = const Icon(MyIcons.Confirm, color: Colors.blue);

    if (leading == null && widget.automaticallyLeading) {
      if (canPop) {
        leading = const BackButton();
      }
    }

    if (leading != null) {
      leading = ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          width: kToolbarHeight,
          height: tabbarHeight,
        ),
        child: leading,
      );
    }

    // if (leading != null) {
    //   leading = InkWell(
    //     child: leading,
    //     onTap: () {},
    //   );
    // }

    // return Material(
    //   child: FractionallySizedBox(
    //     widthFactor: 1,
    //     child: Container(
    //       height: widget.tabbarHeight,

    //       ),
    //       child: leading,
    //     ),
    //   ),

    title = DefaultTextStyle(
      style: TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      child: title,
    );

    title = Positioned(
      left: leading == null || widget.centerTitle ? 16 : kToolbarHeight,
      right: 0,
      height: tabbarHeight,
      child: Row(
        children: [title],
        mainAxisAlignment: widget.centerTitle
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );

    Widget actionWidget;
    if (actions != null) {
      actionWidget = Positioned(
        right: 0,
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(
            width: kToolbarHeight,
            height: tabbarHeight,
          ),
          child: Row(
            children: actions,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
          ),
        ),
      );
    }

    Widget tabbar = Container(
      width: Responsive.screenWidth,
      height: tabbarHeight,
      decoration: BoxDecoration(
        boxShadow: widget.boxShadow,
        color: Colors.white,
      ),
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            if (leading != null) leading,
            title,
            if (actionWidget != null) actionWidget,
          ],
        ),
      ),
    );

    return tabbar;
  }
}

class Tailing extends StatefulWidget {
  final List<Widget> actions;

  Tailing({this.actions});
  @override
  _TailingState createState() => _TailingState();
}

class _TailingState extends State<Tailing> {
  bool showActions = false;

  void toggle() {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Icon(
          Icons.more_horiz,
          size: 38,
        ),
      ),
      onTap: () {
        setState(() {
          showActions = true;
        });
      },
    );
  }
}
