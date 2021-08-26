import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movieapp/views/movie_page.dart';
import 'package:movieapp/views/toprated.dart';
import 'package:movieapp/views/upcoming.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  List<String> data = [
    "https://cdn.dribbble.com/users/3281732/screenshots/8159457/media/9e7bfb83b0bd704e941baa7a44282b22.jpg?compress=1&resize=600x600",
    "https://cdn.dribbble.com/users/3281732/screenshots/7012328/media/bcd672685071ca4da27d5f3ea44ac5db.jpg?compress=1&resize=600x600",
    "https://cdn.dribbble.com/users/3281732/screenshots/6727912/samji_illustrator.jpeg?compress=1&resize=600x600",
    "https://cdn.dribbble.com/users/3281732/screenshots/10940512/media/b2a8ea95c550e5f09d0ca07682a3c0da.jpg?compress=1&resize=600x600",
    "https://cdn.dribbble.com/users/3281732/screenshots/8616916/media/a7e39b15640f8883212421d134013e38.jpg?compress=1&resize=600x600",
    "https://cdn.dribbble.com/users/3281732/screenshots/6590709/samji_illustrator.jpg?compress=1&resize=600x600",
  ];

  int _currentPage = 0;
  final PageController ctrl = PageController(
    viewportFraction: 0.55,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: Container(
            key: ValueKey<String>(data[_currentPage]),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(data[_currentPage]),
                fit: BoxFit.fill,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 15,
                sigmaY: 15,
              ),
              child: Container(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          ),
        ),
        FractionallySizedBox(
          heightFactor: 0.55,
          child: PageView.builder(
            controller: ctrl,
            itemCount: data.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              final bool active = index == _currentPage;

              final double blur = active ? 30 : 0;
              final double offset = active ? 20 : 0;
              final double top = active ? 150 : 200;
              return AnimatedContainer(
                child: Image.network(data[index]),
                duration: Duration(milliseconds: 500),
                curve: Curves.easeOutQuint,
                margin: EdgeInsets.only(top: top, bottom: 50, right: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black87,
                          blurRadius: blur,
                          offset: Offset(offset, offset))
                    ]),
              );
            },
          ),
        )
      ],
    );
  }
}
    
























//      DefaultTabController(
//       length: 3,
//       child: Scaffold(
//           key: _key,
//           drawer: NavDrawer(),
//           body: NestedScrollView(
//             headerSliverBuilder:
//                 (BuildContext context, bool innerBoxIsScrolled) {
//               return <Widget>[
//                 SliverAppBar(
//                   elevation: 0,
//                   backgroundColor: Colors.black,
//                   leading: IconButton(
//                       onPressed: () {
//                         _key.currentState!.openDrawer();
//                       },
//                       icon: const Icon(Icons.menu, color: Colors.white)),
//                   title: const Text(
//                     'Book Movie',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   pinned: true,
//                   floating: true,
//                   bottom: PreferredSize(
//                     preferredSize: const Size.fromHeight(48),
//                     child: TabBar(
//                       isScrollable: true,
//                       indicatorColor: Colors.teal,
//                       tabs: <Widget>[
//                         const Tab(
//                             child: SizedBox(
//                                 width: 90,
//                                 child: Center(
//                                     child: Text(
//                                   'Now Playing',
//                                   style: TextStyle(color: Colors.white),
//                                 )))),
//                         const Tab(
//                             child: SizedBox(
//                                 width: 90,
//                                 child: Center(
//                                     child: Text(
//                                   'Top Rated',
//                                   style: TextStyle(color: Colors.white),
//                                 )))),
//                         Tab(
//                             // ignore: sized_box_for_whitespace
//                             child: Container(
//                                 width: 90,
//                                 child: const Center(
//                                     child: Text(
//                                   'Upcoming',
//                                   style: TextStyle(color: Colors.white),
//                                 )))),
//                       ],
//                     ),
//                   ),
//                 ),
//               ];
//             },
//             body: TabBarView(
//               children: <Widget>[
//                 NowPlaying(),
//                 TopRated(),
//                 UpComing(),
//               ],
//             ),
//           )),
//     );
//   }
// }

// class NavDrawer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           DrawerHeader(
//             child: const Text(
//               'Book Home',
//               style: TextStyle(color: Colors.white, fontSize: 25),
//             ),
//             decoration: BoxDecoration(
//               color: Colors.red[900],
//             ),
//           ),
//           ListTile(
//             leading: const Icon(Icons.favorite),
//             title: const Text('My Favourite'),
//             onTap: () => <void>{},
//           ),
//           ListTile(
//             leading: const Icon(Icons.movie),
//             title: const Text('Movies'),
//             onTap: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.settings),
//             title: const Text('Settings'),
//             onTap: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.border_color),
//             title: const Text('Feedback'),
//             onTap: () => Navigator.of(context).pop(),
//           ),
//           ListTile(
//             leading: const Icon(Icons.exit_to_app),
//             title: const Text('Logout'),
//             onTap: () => Navigator.of(context).pop(),
//           ),
//         ],
//       ),
//     );
//   }
// }
