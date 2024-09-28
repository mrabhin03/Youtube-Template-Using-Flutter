import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

final List<String> HomeMainrecommonded = [
  "Marvel Studios",
  "Science Fiction",
  "Gaming",
  "Trailers",
  "Music",
  "Rendering",
  "Anime",
  "Science",
  "Visual"
];
final List<List<String>> HomeMainVideos = [
  [
    'KarikkuJam1.jpg',
    "14:08",
    'Karikku.jpg',
    "JAM | Part 2 | Karikku | Comedy",
    "Karikku · 3.4 views · ",
    "20 Sep 2024",
    ""
  ],
  [
    'AnimationVsPhysics.jpg',
    "16:07",
    'AlanBecker.jpg',
    "Animation vs. Physics",
    "Alan Becker · 28M views · ",
    "9 Dec 2023",
    ""
  ],
  [
    'AvengersInfinityWarTrailer.jpg',
    "2:25",
    'Marvel.jpg',
    "Marvel Studios' Avengers: Infinity War Official Trailer",
    "Marvel Entertainment · 264M views · ",
    "29 Nov 2017",
    ""
  ],
  [
    'TransformersOne.jpg',
    "1:29",
    'ParamountPictures.jpg',
    "Transformers One | Final Trailer (2024) - Chris Hemsworth, Brian Tyree Henry, Scarlett Johansson",
    "Paramount Pictures · 2.6M views · ",
    "17 Sep 2024",
    ""
  ],
  [
    'HeyNilaNila.jpg',
    "6:00",
    'Muzik247.jpg',
    "Hey Nila Nila | Sithara Krishnakumar | Vinayak Sasikumar |Sanjay Sukumaran | Naveen S Nair| Madhav S",
    "Muzik247 · 544K views · ",
    "25 Nov 2021",
    ""
  ],
  [
    'KarikkuThanks.jpg',
    "32:25",
    'Karikku.jpg',
    "THENKS! | Part 1 | Karikku | Comedy",
    "Karikku · 13M views · ",
    "21 May 2023",
    ""
  ]
];
List<List<String>> HomeVideos = List.from(HomeMainVideos)..shuffle(Random());
List<String> Homerecommonded = List.from(HomeMainrecommonded)
  ..shuffle(Random());
final List<List<String>> SubMainChannels = [
  ['MarkRober.jpg', "Mark Rober"],
  ['AlanBecker.jpg', "Alan Becker"],
  ['Marvel.jpg', "Marvel Entertainment"],
  ['Karikku.jpg', "Karikku"],
  ['Muzik247.jpg', "Muzik247"],
  ['ParamountPictures.jpg', "Paramount Pictures"],
];
List<List<String>> MainChannels = List.from(SubMainChannels)..shuffle(Random());

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int Mode = 1;
  List<int> PageActive = [1, 0, 0, 0];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      precacheImage(AssetImage('assets/Images/Icons/Home0.png'), context);
      precacheImage(AssetImage('assets/Images/Icons/Home1.png'), context);
      precacheImage(AssetImage('assets/Images/Icons/Shorts0.png'), context);
      precacheImage(AssetImage('assets/Images/Icons/Shorts1.png'), context);
      precacheImage(
          AssetImage('assets/Images/Icons/Subscription-out0.png'), context);
      precacheImage(
          AssetImage('assets/Images/Icons/Subscription-out1.png'), context);
    });
  }

  int ImageChangeSpeed = 150;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 19, 19, 19),
      appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: Color.fromARGB(255, 17, 17, 17),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              (Mode != 2)
                  ? Image.asset(
                      'assets/Images/Icons/YouTube.png',
                      width: 90,
                    )
                  : Container(),
              Container(
                width: (Mode != 2) ? 125 : 92,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    (Mode != 2)
                        ? Image.asset(
                            'assets/Images/Icons/Chromecast.png',
                            width: 25,
                          )
                        : Container(),
                    Icon(
                      (Mode != 2)
                          ? Icons.notifications_none_sharp
                          : Icons.search_sharp,
                      size: 25,
                      color: Colors.white,
                    ),
                    Icon(
                      (Mode != 2) ? Icons.search_sharp : Icons.more_vert_sharp,
                      size: 25,
                      color: Colors.white,
                    )
                  ],
                ),
              )
            ],
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          PageController(Mode, context),
          Container(
            // color: Colors.red,
            width: double.infinity,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      setState(() {
                        Mode = 1;
                        for (int i = 0; i < 4; i++) {
                          PageActive[i] = 0;
                        }
                        PageActive[0] = 1;
                      });
                    });
                  },
                  child: Container(
                    height: double.infinity,
                    color: Colors.transparent,
                    width: 65,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: ImageChangeSpeed),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          child: Image.asset(
                            (PageActive[0] == 0)
                                ? 'assets/Images/Icons/Home0.png'
                                : 'assets/Images/Icons/Home1.png',
                            width: 24,
                            key: ValueKey<int>(PageActive[0]),
                          ),
                        ),
                        Text(
                          "Home",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Mode = 2;
                      for (int i = 0; i < 4; i++) {
                        PageActive[i] = 0;
                      }
                      PageActive[1] = 1;
                    });
                  },
                  child: Container(
                    height: double.infinity,
                    color: Colors.transparent,
                    width: 65,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: ImageChangeSpeed),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          child: Image.asset(
                            (PageActive[1] == 0)
                                ? 'assets/Images/Icons/Shorts0.png'
                                : 'assets/Images/Icons/Shorts1.png',
                            width: 24,
                            key: ValueKey<int>(PageActive[1]),
                          ),
                        ),
                        Text(
                          "Shorts",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: 65,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/Images/Icons/Add.png',
                        width: 38,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Mode = 3;
                      for (int i = 0; i < 4; i++) {
                        PageActive[i] = 0;
                      }
                      PageActive[2] = 1;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    height: double.infinity,
                    width: 65,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: ImageChangeSpeed),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          child: Image.asset(
                            (PageActive[2] == 0)
                                ? 'assets/Images/Icons/Subscription-out0.png'
                                : 'assets/Images/Icons/Subscription-out1.png',
                            width: 24,
                            key: ValueKey<int>(PageActive[2]),
                          ),
                        ),
                        Text(
                          "Subscription",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Mode = 4;
                      for (int i = 0; i < 4; i++) {
                        PageActive[i] = 0;
                      }
                      PageActive[3] = 1;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    height: double.infinity,
                    width: 65,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: ImageChangeSpeed),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          child: Icon(
                            (PageActive[3] == 0)
                                ? Icons.account_circle_outlined
                                : Icons.account_circle_rounded,
                            color: Colors.white,
                            size: 24,
                            key: ValueKey<int>(PageActive[3]),
                          ),
                        ),
                        Text(
                          "You",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget PageController(Mode, context) {
  switch (Mode) {
    case 1:
      return LoadHome();
    case 2:
      return LoadShorts(context);
    case 3:
      return LoadSubs();
    case 4:
      return LoadProfile();
    default:
      return LoadHome();
  }
}

Widget LoadHome() {
  List<List<String>> Videos = HomeVideos;
  List<String> recommonded = Homerecommonded;

  for (var data in Videos) {
    data[6] = dateClculation(data[5]);
  }
  return Expanded(
    child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 4),
            width: double.infinity,
            height: 45,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 37, 37, 37),
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "All",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  for (var data in recommonded)
                    Container(
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 37, 37, 37),
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          data,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Column(
              children: [
                for (var Video in Videos)
                  Container(
                    width: double.infinity,
                    // color: Colors.red,
                    margin: EdgeInsetsDirectional.only(bottom: 20),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              'assets/Images/Thumbnails/' + Video[0],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                            Positioned(
                              bottom: 6,
                              right: 4,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 0, 0, 0)
                                        .withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(4)),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    Video[1],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: Image.asset(
                                    'assets/Images/Profiles/' + Video[2],
                                    fit: BoxFit.contain,
                                    height: 35,
                                    width: 35,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                    child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        Video[3],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontSize: 15,
                                            height: 1.2,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      Text(Video[4] + Video[6],
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color.fromARGB(
                                                  255, 220, 220, 220)))
                                    ],
                                  ),
                                )),
                                Icon(
                                  Icons.more_vert_sharp,
                                  color: Color.fromARGB(255, 224, 224, 224),
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget LoadShorts(context) {
  return Expanded(
    child: PageView(
      scrollDirection: Axis.vertical,
      children: [
        Container(
          color: Colors.green,
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Stack(
            children: [Text("KKK"), Text("data")],
          ),
        ),
      ],
    ),
  );
}

Widget LoadSubs() {
  final List<String> recommonded = [
    "Today",
    "Videos",
    "Shorts",
    "Live",
    "Posts",
    "Continue Watching",
    "Unwatched"
  ];
  final List<List<String>> SubMainChannels = [
    ['MarkRober.jpg', "Mark Rober"],
    ['AlanBecker.jpg', "Alan Becker"],
    ['Marvel.jpg', "Marvel Entertainment"],
    ['Karikku.jpg', "Karikku"],
    ['Muzik247.jpg', "Muzik247"],
    ['ParamountPictures.jpg', "Paramount Pictures"],
  ];
  List<List<String>> Channels = MainChannels;
  final List<List<String>> Videos = [
    [
      'TransformersOne.jpg',
      "1:29",
      'ParamountPictures.jpg',
      "Transformers One | Final Trailer (2024) - Chris Hemsworth, Brian Tyree Henry, Scarlett Johansson",
      "Paramount Pictures · 2.6M views · ",
      "17 Sep 2024"
    ],
    [
      'MyPuzzleRobot.jpg',
      "21:20",
      'MarkRober.jpg',
      "My Puzzle Robot is 200x Faster Than a Human",
      "Mark Rober · 20M views · ",
      "13 Jul 2024"
    ],
    [
      'AnimationVsPhysics.jpg',
      "16:07",
      'AlanBecker.jpg',
      "Animation vs. Physics",
      "Alan Becker · 28M views · ",
      "9 Dec 2023"
    ],
    [
      'KarikkuThanks.jpg',
      "32:25",
      'Karikku.jpg',
      "THENKS! | Part 1 | Karikku | Comedy",
      "Karikku · 13M views · ",
      "21 May 2023"
    ],
    [
      'HeyNilaNila.jpg',
      "6:00",
      'Muzik247.jpg',
      "Hey Nila Nila | Sithara Krishnakumar | Vinayak Sasikumar |Sanjay Sukumaran | Naveen S Nair| Madhav S",
      "Muzik247 · 544K views · ",
      "25 Nov 2021"
    ],
    [
      'AvengersInfinityWarTrailer.jpg',
      "2:25",
      'Marvel.jpg',
      "Marvel Studios' Avengers: Infinity War Official Trailer",
      "Marvel Entertainment · 264M views · ",
      "29 Nov 2017"
    ],
  ];
  for (var data in Videos) {
    data[4] += dateClculation(data[5]);
  }
  return Expanded(
    child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
              width: double.infinity,
              height: 99,
              // color: Colors.red,
              child: Row(
                children: [
                  Expanded(
                      child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (var channel in Channels)
                          Container(
                            margin: EdgeInsets.only(right: 0),
                            width: 75,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: Image.asset(
                                      'assets/Images/Profiles/' + channel[0],
                                      fit: BoxFit.contain,
                                      height: 60,
                                      width: 60,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Center(
                                    child: Container(
                                      width: 50,
                                      child: Text(
                                        channel[1],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 13,
                                            height: 1.2,
                                            fontWeight: FontWeight.w500,
                                            color: const Color.fromARGB(
                                                255, 226, 226, 226)),
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                      ],
                    ),
                  )),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "All",
                        style: TextStyle(fontSize: 15, color: Colors.blue),
                      ),
                    ),
                  )
                ],
              )),
          Container(
            margin: EdgeInsets.only(bottom: 4),
            width: double.infinity,
            height: 45,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 37, 37, 37),
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "All",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  for (var data in recommonded)
                    Container(
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 37, 37, 37),
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          data,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Column(
              children: [
                for (var Video in Videos)
                  Container(
                    width: double.infinity,
                    // color: Colors.red,
                    margin: EdgeInsetsDirectional.only(bottom: 20),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              'assets/Images/Thumbnails/' + Video[0],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                            Positioned(
                              bottom: 6,
                              right: 4,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 0, 0, 0)
                                        .withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(4)),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    Video[1],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: Image.asset(
                                    'assets/Images/Profiles/' + Video[2],
                                    fit: BoxFit.contain,
                                    height: 35,
                                    width: 35,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                    child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        Video[3],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontSize: 15,
                                            height: 1.2,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      Text(Video[4],
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color.fromARGB(
                                                  255, 220, 220, 220)))
                                    ],
                                  ),
                                )),
                                Icon(
                                  Icons.more_vert_sharp,
                                  color: Color.fromARGB(255, 224, 224, 224),
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget LoadProfile() {
  return Expanded(
    child: Container(
      color: Colors.red,
      height: 200,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Profile Page is underProgress",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          Icon(
            Icons.warning_amber_rounded,
            size: 100,
          )
        ],
      ),
    ),
  );
}

String dateClculation(String targetDateString) {
  DateTime targetDate;
  try {
    targetDate = DateFormat('dd MMM yyyy').parse(targetDateString);
  } catch (e) {
    return 'Invalid date format';
  }
  DateTime now = DateTime.now();
  Duration diff = now.difference(targetDate);

  if (diff.inDays > 365) {
    int years = (diff.inDays / 365).floor();
    return years == 1 ? '1 year ago' : '$years years ago';
  } else if (diff.inDays > 30) {
    int months = (diff.inDays / 30).floor();
    return months == 1 ? '1 month ago' : '$months months ago';
  } else if (diff.inDays > 0) {
    return diff.inDays == 1 ? '1 day ago' : '${diff.inDays} days ago';
  } else if (diff.inHours > 0) {
    return diff.inHours == 1 ? '1 hour ago' : '${diff.inHours} hours ago';
  } else if (diff.inMinutes > 0) {
    return diff.inMinutes == 1
        ? '1 minute ago'
        : '${diff.inMinutes} minutes ago';
  } else {
    return 'just now';
  }
}
