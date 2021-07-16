//extend dari base_page.dart
part of 'base_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.centerLeft,
            child: Textheading3(text: 'Now Playing'),
          ),
          Divider(
            height: 50,
            color: Dimens.color_primary,
            thickness: 2,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CardComponent(
                    width: 160,
                    height: 280,
                    imageurl:
                        'https://image.tmdb.org/t/p/w500/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg',
                    judul: 'The walking dead',
                    date: '3 jan 2020'),
                CardComponent(
                    width: 160,
                    height: 280,
                    imageurl:
                        'https://image.tmdb.org/t/p/w500/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg',
                    judul: 'The walking dead',
                    date: '3 jan 2020'),
                CardComponent(
                    width: 160,
                    height: 280,
                    imageurl:
                        'https://image.tmdb.org/t/p/w500/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg',
                    judul: 'The walking dead',
                    date: '3 jan 2020'),
                CardComponent(
                    width: 160,
                    height: 280,
                    imageurl:
                        'https://image.tmdb.org/t/p/w500/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg',
                    judul: 'The walking dead',
                    date: '3 jan 2020'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
