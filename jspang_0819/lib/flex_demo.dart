import 'package:flutter/material.dart';

class FlexDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var redBox = Container(
      color: Colors.red,
      height: 50,
      width: 50,
    );
    var blueBox = Container(
      color: Colors.blue,
      height: 30,
      width: 60,
    );
    var yellowBox = Container(
      color: Colors.yellow,
      height: 50,
      width: 100,
    );
    var greenBox = Container(
      color: Colors.green,
      height: 50,
      width: 50,
    );
    var greedBox = Container(
      color: Colors.red,
      height: 60,
      width: 60,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: ArticlePanel(
        article: ArticleBean(
            userName: "张风捷特烈",
            title: "[Flutter必备]-Flex布局完全解读",
            info: "也就是水平排放还是竖直排放，可以看出默认情况下都是主轴顶头,"
                "交叉轴居中比如horizontal下主轴为水平轴，交叉轴则为竖直。也就是水平顶头，竖直居中"
                "这里使用MultiShower快速展示,更好的对比出不同之处",
            type: "Flutter/Dart",
            starCount: "2000",
            commentCount: "3000",
            userIcon: Image.asset("images/icon_head.png"),
            cover: Image.asset("images/wy_300x200.jpg", fit: BoxFit.cover)),
      ),

      // showItem()
      // Container(
      //   child: Flex(
      //     direction: Axis.vertical,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     // textBaseline: TextBaseline.alphabetic,
      //     mainAxisSize: MainAxisSize.min,
      //     verticalDirection: VerticalDirection.down,
      //     // children: <Widget>[Expanded(child:redBox) , blueBox, Expanded(child: yellowBox) , greenBox],
      //   ),
      // )
    );
  }
}

class ArticleBean {
  Image userIcon; //头像
  Image cover; //图片
  String userName; //用户名
  String title; //标题
  String type; //类型
  String info; //简介
  String starCount; //赞
  String commentCount;

  ArticleBean(
      {this.userIcon,
      this.cover,
      this.userName,
      this.title,
      this.type,
      this.info,
      this.starCount,
      this.commentCount}); //评论数

}

typedef TapCallback = void Function(ArticleBean bean);

class ArticlePanel extends StatelessWidget {
  final ArticleBean article;
  final TapCallback onTap;
  ArticlePanel({Key key, this.article, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return _showItem(article);
  }

  _showItem(ArticleBean article) {
    var infoStyle = TextStyle(color: Color(0xff999999), fontSize: 13);
    var littleStyle = TextStyle(color: Colors.black, fontSize: 16);

    var top = Row(
      //顶部,通过Flex布局的Row进行横向排列,Expanded中间
      children: [
        Container(child: article.userIcon, width: 20, height: 20),
        Expanded(
          child: Padding(
            child: Text(article.userName),
            padding: EdgeInsets.only(left: 4),
          ),
        ),
        Text(
          article.type,
          style: infoStyle,
        )
      ],
    );

    var content = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          article.title,
          style: littleStyle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Padding(
          child: Text(article.info,
              style: infoStyle, maxLines: 2, overflow: TextOverflow.ellipsis),
          padding: EdgeInsets.only(top: 5),
        )
      ],
    );

    var center = Row(
      //中间的部分
      children: [
        Expanded(
            child: Padding(
          child: content,
          padding: EdgeInsets.all(5),
        )),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          child: Container(
            width: 80,
            height: 80,
            child: article.cover,
          ),
        )
      ],
    );

    var end = Row(
      //底部
      children: [
        Icon(
          Icons.grade,
          color: Colors.green,
          size: 20,
        ),
        Text(
          article.starCount,
          style: infoStyle,
        ),
        Padding(
          child: Icon(Icons.tag_faces, color: Colors.lightBlueAccent, size: 20),
          padding: EdgeInsets.symmetric(horizontal: 5),
        ),
        Text(article.commentCount, style: infoStyle),
      ],
    );

    var result = Card(
      child: Container(
        height: 160,
        color: Colors.white10,
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            top,
            Expanded(
              child: center,
            ),
            end
          ],
        ),
      ),
    );

    return result;
  }
}
