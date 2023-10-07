import 'package:flutter/material.dart';
import 'package:flutter_application_3/Music_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Searchpage(),
    );
  }
}

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  
  static List<Model> main_music_list = [
    Model(
        "Awara saam hai",
        2019,
        "https://wynk.in/music/song/aawara-shaam-hai/pc_INM241820594?q=awara+s",
        9.3,
        "https://www.quirkybyte.com/wp-content/uploads/2020/06/15-7-780x470.jpg"),
    Model(
        'Apna Bana Le',
        2022,
        "https://wynk.in/music/song/apna-bana-le/zm_INZ031411736?q=apna+bana+e",
        9.0,
        "https://is1-ssl.mzstatic.com/image/thumb/Music122/v4/2e/0b/c0/2e0bc070-112f-a827-6ad8-6bc64f7caaff/840214460180.png/1200x1200bf-60.jpg"),
    Model(
        'Phir Aur kya Chahiye',
        2023,
        "https://wynk.in/music/song/phir-aur-kya-chahiye-from-zara-hatke-zara-bachke/sa_8907212007012_INH102307527?q=phir+",
        8.5,
        "https://thewurdz.com/wp-content/uploads/2023/05/phir-aur-kya-chahiye-lyrics-1200x675.jpg"),
    Model(
        "Bombay To Punjab",
        2019,
        "https://wynk.in/music/song/bombay-to-punjab/gk_ING501801924?q=bombay",
        8.9,
        "https://i.ytimg.com/vi/HPJ92BZvhkw/maxresdefault.jpg"),
    Model(
        'Holi Holi',
        2020,
        "https://wynk.in/music/song/hauli-hauli/hu_47814165?q=hauli+hauli+",
        9.1,
        "https://i.ytimg.com/vi/XfkZnbdMRP8/hqdefault.jpg"),
  ];
  List<Model> display_list = List.from(main_music_list);
  void Music_list(String value) {
    setState(() {
      display_list = main_music_list
          .where((element) =>
              element.music_title!.toLowerCase().contains(value.toLowerCase()))
          .toList();
          
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Music',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 35),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search for Music",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: ((value) {
                Music_list(value);
              }),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "eg: Sawan Aaya hai",
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: Colors.black),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: display_list.length == 0
                    ? Center(
                        child: Text(
                          "Not found",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 35),
                        ),
                      )
                    : ListView.builder(
                        itemCount: display_list.length,
                        itemBuilder: (context, index) => ListTile(
                          contentPadding: EdgeInsets.all(8.0),
                          title: Text(
                            display_list[index].music_title!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                          subtitle: Text(
                            '${display_list[index].music_release!}',
                            style: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.italic),
                          ),
                          trailing: Text(
                            "${display_list[index].rating!}",
                            style: TextStyle(color: Colors.orange),
                          ),
                          leading: Image.network(
                              "${display_list[index].music_photo}"),
                        ),
                      ))
          ],
        ),
      ),
    );
  }
}
