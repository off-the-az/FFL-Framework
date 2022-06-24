// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mykowel/framework/front-end%20connection/Design/Color.dart';
import 'package:mykowel/framework/front-end%20connection/Logic/Logic.dart';
import 'package:mykowel/main.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Page Drawer/A-Panel Page/A-Panel_Page.dart';

// ignore: non_ant_identifier_names, non_constant_identifier_names
Widget menu(BuildContext context) {
  return SafeArea(
    child: Container(
      padding: const EdgeInsets.only(top: 20),
      child: ListTileTheme(
        textColor: text_color,
        iconColor: icon_color,
        child: ListView(
          children: [
            Container(
                width: 40.0,
                height: 50.38,
                margin:  const EdgeInsets.only(
                  left: 20,
                  top: 24.0,
                ),
                clipBehavior: Clip.antiAlias,
                decoration:  const BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Align(
                    alignment: Alignment.center,
                    child: Image.asset('assets/images/town_logo.png'))),
             const SizedBox(
              height: 5,
            ),
             const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child:  Text(
                "My Kowel",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
             const SizedBox(
              height: 20,
            ),
            
             const Padding(
              padding:
                   EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
              child: Text(
                'Основна частина',
                style: TextStyle( fontSize: 14),
              ),
            ),
            ListTile(
              onTap: () {
                
              },
              leading: const Icon(Iconsax.main_component),
              title: const Text('Головна'),
            ),
            is_admin == '1' ? ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  APanelPage()));
              },
              leading: Icon(Iconsax.command),
              title: Text('A-Panel'),
            ): SizedBox(width: 0,),
            Divider(
              color: Colors.grey.shade800,
            ),
             const Padding(
              padding:
                   EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
              child: Text(
                'Інформаційна частина',
                style: TextStyle( fontSize: 14),
              ),
            ),
            ListTile(
              onTap: () {
                
              },
              leading: const Icon(Iconsax.note_text),
              title: const Text('Новини'),
            ),
            ListTile(
              onTap: () {
                
              },
              leading: const Icon(Iconsax.calendar),
              title: const Text('Афіша подій'),
            ),
            ListTile(
              onTap: () {
                
              },
              leading: const Icon(Iconsax.book),
              title: const Text('Телефонна книга міста'),
            ),
            Divider(
              color: Colors.grey.shade800,
            ),
             const Padding(
              padding:
                   EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
              child: Text(
                'Комунікативна частина',
                style: TextStyle( fontSize: 14),
              ),
            ),
            ListTile(
              onTap: () {
                
              },
              leading: const Icon(Iconsax.shop),
              title: const Text('Ковель ʼБазарʼ'),
            ),
            ListTile(
              onTap: () {
                
              },
              leading: const Icon(Iconsax.warning_2),
              title: const Text('Проблеми у місті'),
            ),
            ListTile(
              onTap: () {
                
              },
              leading: Icon(Iconsax.home_trend_up),
              title: Text('Вакансії'),
            ),
            Divider(
              color: Colors.grey.shade800,
            ),
             const Padding(
              padding:
                   EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
              child: Text(
                'Службова частина',
                style: TextStyle( fontSize: 14),
              ),
            ),
            ListTile(
              onTap: () {
                
              },
              leading: Icon(Iconsax.support),
              title: Text('Тех. підтримка'),
            ),
            ListTile(
              onTap: () {
                
              },
              leading: Icon(Iconsax.additem),
              title: Text('Модернізувати проєкт'),
            ),
            Divider(
              color: Colors.grey.shade800,
            ),
              const Padding(
              padding:
                   EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
              child: Text(
                'Біографічна частина',
                style: TextStyle( fontSize: 14),
              ),
            ),
             ListTile(
              onTap: () {
                
              },
              leading: const Icon(Iconsax.info_circle),
              title: const Text('Про проєкт'),
            ),
             const SizedBox(
              height: 10,
            ),
           const  Padding(
              padding:
                  EdgeInsets.only(left: 20.0, top: 20.0, bottom: 10.0),
              child: Text(
                'Версія 0.1.1(beta)',
                style: TextStyle(color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
