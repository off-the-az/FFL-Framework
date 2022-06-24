import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:mykowel/framework/front-end%20connection/Design/Color.dart';

import '../Menu drawer/Menu.dart';


final _advancedDrawerController = AdvancedDrawerController();


  //Home Page App Bar
  Widget _appbar() {
    double width = MediaQuery.of(context).size.width;

    return SliverAppBar(
      expandedHeight: 250.0,
      elevation: 0,
      pinned: true,
      stretch: true,
      toolbarHeight: 80,
      backgroundColor: Colors.white,
      leading: IconButton(
        color: Colors.black,
        onPressed: _handleMenuButtonPressed,
        icon: ValueListenableBuilder<AdvancedDrawerValue>(
          valueListenable: _advancedDrawerController,
          builder: (_, value, __) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 100),
              child: Icon(
                value.visible ? Iconsax.close_square : Iconsax.menu,
                key: ValueKey<bool>(value.visible),
              ),
            );
          },
        ),
      ),
      actions: [
        IconButton(onPressed: (){
          /*if(demo != true)
          {
            updateFile(token: null);
            Phoenix.rebirth(context);
          }
          else{
            demo = false;
            Phoenix.rebirth(context);
          }*/
          
        }, icon: Icon(Iconsax.logout, color: Colors.black,))
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      centerTitle: true,
      title: AnimatedOpacity(
        opacity: _isScrolled ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500),
        child: Column(
          children: [
            Text(
              'My Kovel',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 30,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        titlePadding: const EdgeInsets.only(left: 20, right: 20),
        title: AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: _isScrolled ? 0.0 : 1.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FadeIn(
                duration: const Duration(milliseconds: 500),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: width <= 400.0 ? 20 : 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          subtitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: width <= 400.0 ? 10 : 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 30,
                height: 3,
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Home Page Body
  Widget _sliverBody() {
    return SliverFillRemaining(
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Column(
          children: [
            FadeInDown(
              duration: Duration(milliseconds: 500),
              child: Row(children: [
                Text(
                  'Останні повідомлення',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ]),
            ),
            _notificationList(),
          ],
        ),
      ),
    );
  }

  // Home Page Notification List
  Widget _notificationList() {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(top: 20),
        physics: NeverScrollableScrollPhysics(),
        itemCount: _postsJson_notif.length,
        itemBuilder: (context, index) {
          var post = _postsJson_notif[index];
          return FadeInDown(
            duration: Duration(milliseconds: 500),
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        margin: const EdgeInsets.only(
                          left: 10.0,
                          right: 10.0,
                          top: 10.0,
                        ),
                        width: 750,
                        child: Text(
                          post["title"],
                          style: TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 10.0, bottom: 10.0),
                              width: 750,
                              child: Text(
                                post["author"],
                                style: TextStyle(
                                    color: Colors.grey.shade500, fontSize: 10),
                              )))
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
/*
  //Home Action Carousel
  Widget _homeSliverList() {
    return SliverList(
        delegate: SliverChildListDelegate([
      SizedBox(
        height: 20,
      ),
      Container(
        padding: EdgeInsets.only(top: 20),
        height: 115,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: home_services.length,
          itemBuilder: (context, index) {
            return FadeInDown(
              duration: Duration(milliseconds: (index + 1) * 100),
              child: AspectRatio(
                aspectRatio: 1,
                child: GestureDetector(
                  onTap: () {
                    _carouselState(index);
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: light_bck_btn,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Icon(
                            home_services[index][1],
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        home_services[index][0],
                        style: TextStyle(
                            color: Colors.grey.shade800, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ]));
  }

  //Home Carousel State
  void _carouselState(int index) {
    if (home_services[index][0] == 'Новини міста') {
      link = 'https://kovel.media/feed/json';
      title = news_title;
      subtitle = news_subtitle;
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => news_page()),
          (route) => false);
    } 
    if (home_services[index][0] == 'Афіша подій') {
      link = 'https://mykovel.pp.ua/api/events';
      title = events_title;
      subtitle = events_subtitle;
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => events_page()),
            (route) => false);
      } 
    if (home_services[index][0] == 'Ковель ʼБазарʼ') {
      link = 'https://mykovel.pp.ua/api/bazar';
      title = bazar_title;
      subtitle = bazar_subtitle;
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => bazar_page()),
              (route) => false);
        } else 
    if (home_services[index][0] == 'Більше') {
            _advancedDrawerController.showDrawer();
          } else {
            print('Work');
          }
        }*/
Future _refreshData() async {
    await Future.delayed(Duration(seconds: 3));
}