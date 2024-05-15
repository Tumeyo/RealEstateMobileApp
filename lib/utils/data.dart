import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

var profile =
    "https://dogtime.com/wp-content/uploads/sites/12/2024/04/GettyImages-1451526081-e1713534887441.jpg?w=1024";

List populars = [
  {
    "image":
        "https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Single Villa",
    "price": "1'150'000'000₮",
    "location": "Улаанбаатар, Нүхт",
    "Description":
        "Нүхтийн ам Р блокийн 20 тоот Вилла худалдана. Дулааны шугам, тог цахилгаан холбогдсон, ус,тог тасарсан ч снаа зовох зүйлгүй нэмэлт усны нөөц агуулахтай, усаа шугамнаас халаагаад дулаанаа хадгалж болно, шинэ засвар тохитой чимээгүй орчин. Түрээслэх боломжтой ",
    "is_favorited": true,
  },
  {
    "image":
        "https://images.unsplash.com/photo-1598928506311-c55ded91a20c?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Convertible Studio",
    "price": "500'000'000₮",
    "location": "Улаанбаатар, Хан-Уул",
    "Description": "Зарна граштай ",
    "is_favorited": false,
  },
  {
    "image":
        "https://images.unsplash.com/photo-1576941089067-2de3c901e126?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Twin Castle",
    "price": "1'500'000'000₮",
    "location": "Улаанбаатар, Зайсан",
    "Description": "Зарна граштай ",
    "is_favorited": false,
  },
  {
    "image":
        "https://images.unsplash.com/photo-1549517045-bc93de075e53?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Twin Villa",
    "price": "₮2'000'000'000₮",
    "location": "Улаанбаатар, Яармаг",
    "Description": "Зарна граштай ",
    "is_favorited": false,
  },
];

List recommended = [
  {
    "image":
        "https://images.unsplash.com/photo-1592595896616-c37162298647?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Garden House",
    "price": "280'000'000₮",
    "location": "Улаанбаатар, Бумбат",
    "Description": "Зарна граштай ",
    "is_favorited": true,
  },
  {
    "image":
        "https://images.unsplash.com/photo-1576941089067-2de3c901e126?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Twin Castle",
    "price": "2'000'000'000₮",
    "location": "Улаанбаатар, Нүхт",
    "Description": "Зарна граштай ",
    "is_favorited": false,
  },
  {
    "image":
        "https://images.unsplash.com/photo-1625602812206-5ec545ca1231?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "King Villa",
    "price": "₮1'110'500'000₮",
    "location": "Улаанбаатар, Бугийн ам",
    "Description": "Зарна граштай ",
    "is_favorited": true,
  },
];

List recents = [
  {
    "image":
        "https://images.unsplash.com/photo-1549517045-bc93de075e53?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Double Villa",
    "price": "3'000'000'000₮",
    "location": "Улаанбаатар, Жаргалантын ам",
    "Description": "Зарна граштай ",
    "is_favorited": false,
  },
  {
    "image":
        "https://images.unsplash.com/photo-1598928506311-c55ded91a20c?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Convertible Studio",
    "price": "500'000'000₮",
    "location": "Улаанбаатар, Нисэх",
    "Description": "Зарна граштай ",
    "is_favorited": false,
  },
  {
    "image":
        "https://images.unsplash.com/photo-1576941089067-2de3c901e126?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Double Villa",
    "price": "1'900'000'000₮",
    "location": "Улаанбаатар, Арцатын ам ",
    "Description": "Зарна граштай ",
    "is_favorited": false,
  },
];

List categories = [
  {"name": "Бүгд", "icon": FontAwesomeIcons.boxes},
  {"name": "Вилла", "icon": FontAwesomeIcons.university},
  {"name": "Дэлгүүр", "icon": FontAwesomeIcons.storeAlt},
  {"name": "Барилга", "icon": FontAwesomeIcons.building},
  {"name": "Хаус", "icon": FontAwesomeIcons.home},
];

var brokers = [
  {
    "image":
        "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjV8fHByb2ZpbGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Hulan",
    "type": "Broker",
    "description": "tailbar",
    "rate": 4,
  },
  {
    "image":
        "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fHByb2ZpbGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Tamiraa Chuluun",
    "type": "Broker",
    "description": "tailbar",
    "rate": 5,
  },
  {
    "image":
        "https://images.unsplash.com/photo-1617069470302-9b5592c80f66?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Z2lybHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Hatanbaatar Chudamba",
    "type": "Broker",
    "description": "tailbar delgerengui",
    "rate": 4,
  },
  {
    "image":
        "https://images.unsplash.com/photo-1545167622-3a6ac756afa4?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTB8fHByb2ZpbGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Doljin",
    "type": "Broker",
    "description": "tailbar",
    "rate": 3,
  },
];

List companies = [
  {
    "image":
        "https://images.unsplash.com/photo-1549517045-bc93de075e53?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Remax",
    "location": "Ulaanbaatar",
    "type": "Broker",
    "is_favorited": false,
    "icon": Icons.domain_rounded
  },
  {
    "image":
        "https://images.unsplash.com/photo-1618221469555-7f3ad97540d6?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Century 21",
    "location": "Ulaanbaatar",
    "type": "Broker",
    "is_favorited": true,
    "icon": Icons.house_siding_rounded
  },
  {
    "image":
        "https://images.unsplash.com/photo-1625602812206-5ec545ca1231?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Dabest Pro",
    "location": "Ulaanbaatar",
    "type": "Broker",
    "is_favorited": true,
    "icon": Icons.home_work_rounded
  },
  {
    "image":
        "https://images.unsplash.com/photo-1625602812206-5ec545ca1231?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Cam Reality",
    "location": "Ulaanbaatar",
    "type": "Broker",
    "is_favorited": true,
    "icon": Icons.location_city_rounded
  },
];
