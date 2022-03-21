import 'package:flutter/material.dart';

class AppWidgets {
  static getAppBar(BuildContext context, {bool showBackButton = false}) {
    return AppBar(
        // automaticallyImplyLeading: false,
        flexibleSpace: Container(
          child: getTopDesign(context),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        titleSpacing: 8,
        leading: showBackButton ? getBackButton(context) : Container());
  }

  static Widget getTopDesign(context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(120),
                        topLeft: Radius.circular(60),
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 60,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(120),
                      bottomRight: Radius.circular(120),
                    )),
              ),
            ],
          ),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(160),
                )
                // image: DecorationImage(
                //   image: AssetImage("assets/images/app_bar_bg.PNG"),
                //   fit: BoxFit.fill,
                // ),
                ),
          ),
        ]);
  }

  static Widget getBackButton(context) {
    return Container(
        width: 32,
        height: 32,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_sharp,
            color: Theme.of(context).iconTheme.color,
          ),
        ));
  }

  static Widget pageTitle(String title) {
    return Text(
      title,
      textAlign: TextAlign.start,
      style: const TextStyle(
          fontSize: 40, fontWeight: FontWeight.w600, letterSpacing: 0.5),
    );
  }

  static getOrOptionDivider(BuildContext context, String text) {
    return Row(children: [
      Expanded(
          child: Divider(
        color: Theme.of(context).unselectedWidgetColor,
      )),
      Container(
        child: Text(text),
        margin: const EdgeInsets.only(left: 25, right: 25),
      ),
      Expanded(
          child: Divider(
        color: Theme.of(context).unselectedWidgetColor,
      )),
    ]);
  }
}
