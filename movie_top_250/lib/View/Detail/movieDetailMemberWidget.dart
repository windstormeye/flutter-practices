import 'package:flutter/material.dart';
import 'package:movie_top_250/Model/movieModel.dart';

Widget movieDetailMemberWidget(MovieDetail movieDetail) {
  List<Widget> memberWidgets = [];

  for (MovieMember member in movieDetail.director) {
    memberWidgets.add(_buildMemberWidget(member, true));
  }

  for (MovieMember member in movieDetail.casts) {
    memberWidgets.add(_buildMemberWidget(member, false));
  }

  return new SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: new Row(
      children: memberWidgets,
    ),
  );
}

Widget _buildMemberWidget(MovieMember member, bool isDirector) {
  var col = new Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      new Container(
        width: 110,
        height: 160,
        decoration: new BoxDecoration(
          image: DecorationImage(image: NetworkImage(member.avatarUrl)),
          borderRadius: new BorderRadius.all(
            const Radius.circular(8.0),
          ),
        ),
      ),
      new Text(member.name,
        style: new TextStyle(
            color: Colors.white,
        ),
      ),
    ],
  );


  if (isDirector) {
    col.children.add(
      new Text(
        '导演',
        style: new TextStyle(
            fontSize: 13,
            color: Color.fromRGBO(150, 150, 150, 1)
        ),
      )
    );
  } else {
    col.children.add(
        new Text(
          '演员',
          style: new TextStyle(
              fontSize: 13,
              color: Color.fromRGBO(150, 150, 150, 1)
          ),
        )
    );
  }

  return new Container(
    width: 110,
    child: new Padding(
      padding: EdgeInsets.all(15),
      child: col,
    ),
  );
}
