import 'package:flutter/material.dart';

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
  final List<String> recommonded = [
    "All",
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

  @override
  Widget build(BuildContext context) {
    final List<List<String>> Videos = [
      [
        'KarikkuJam1.jpg',
        "14:08",
        'Karikku.jpg',
        "JAM | Part 2 | Karikku | Comedy",
        "Karikku · 3.4 views · 1 day ago"
      ],
      [
        'AnimationVsPhysics.jpg',
        "16:07",
        'AlanBecker.jpg',
        "Animation vs. Physics",
        "Karikku · 28M views · 9 months ago"
      ],
      [
        'AvengersInfinityWarTrailer.jpg',
        "2:25",
        'Marvel.jpg',
        "Marvel Studios' Avengers: Infinity War Official Trailer",
        "Marvel Entertainment · 264M views · 6 Years ago"
      ],
      [
        'HeyNilaNila.jpg',
        "6:00",
        'Muzik247.jpg',
        "Hey Nila Nila | Sithara Krishnakumar | Vinayak Sasikumar |Sanjay Sukumaran | Naveen S Nair| Madhav S",
        "Muzik247 · 544K views · 2 Years ago"
      ],
      [
        'TransformersOne.jpg',
        "1:29",
        'ParamountPictures.jpg',
        "Transformers One | Final Trailer (2024) - Chris Hemsworth, Brian Tyree Henry, Scarlett Johansson",
        "Paramount Pictures · 2.6M views · 5 days ago"
      ],
      [
        'KarikkuThanks.jpg',
        "32:25",
        'Karikku.jpg',
        "THENKS! | Part 1 | Karikku | Comedy",
        "Karikku · 13M views · 1 year ago"
      ],
    ];
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 19, 19, 19),
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 17, 17, 17),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/Images/Icons/YouTube.png',
                width: 100,
              ),
              Container(
                width: 140,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/Images/Icons/Chromecast.png',
                      width: 28,
                    ),
                    Icon(
                      Icons.notifications_none_sharp,
                      size: 28,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.search_sharp,
                      size: 28,
                      color: Colors.white,
                    )
                  ],
                ),
              )
            ],
          )),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 60,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var data in recommonded)
                    Container(
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 52, 52, 52),
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          data,
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            width: double.infinity,
            child: SingleChildScrollView(
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
                                bottom: 13,
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
                                          fontSize: 16,
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
                                    borderRadius: BorderRadius.circular(16.0),
                                    child: Image.asset(
                                      'assets/Images/Profiles/' + Video[2],
                                      fit: BoxFit.contain,
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          Video[3],
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontSize: 20,
                                              height: 1.2,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ),
                                        Text(Video[4],
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromARGB(
                                                    255, 224, 224, 224)))
                                      ],
                                    ),
                                  )),
                                  Icon(
                                    Icons.more_vert_sharp,
                                    color: Color.fromARGB(255, 224, 224, 224),
                                    size: 30,
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
          )),
          Container(
            // color: Colors.red,
            width: double.infinity,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: double.infinity,
                  width: 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home_filled,
                        color: Colors.white,
                        size: 38,
                      ),
                      Text(
                        "Home",
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      )
                    ],
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/Images/Icons/Shorts.png',
                        width: 35,
                      ),
                      Text(
                        "Shorts",
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      )
                    ],
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/Images/Icons/Add.png',
                        width: 45,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/Images/Icons/Subscription-out.png',
                        width: 35,
                      ),
                      Text(
                        "Subscription",
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      )
                    ],
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: 65,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_circle_rounded,
                        color: Colors.white,
                        size: 38,
                      ),
                      Text(
                        "You",
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      )
                    ],
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
