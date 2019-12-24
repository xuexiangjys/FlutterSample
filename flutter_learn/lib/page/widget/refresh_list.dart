import 'package:flutter/material.dart';

class RefreshListPage extends StatefulWidget {
  RefreshListPage({this.title = "下拉刷新", Key key}) : super(key: key);

  final String title;

  @override
  _RefreshListPageState createState() => _RefreshListPageState();
}

class _RefreshListPageState extends State<RefreshListPage> {
  List<String> _list = [];
  ScrollController _scrollController = new ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    //加载更多的监听
    _scrollController.addListener(() {
      var position = _scrollController.position;
      // 小于50px时，触发上拉加载；
      if (position.maxScrollExtent - position.pixels < 50) {
        _loadMore();
      }
    });

    initData();
  }

  //数据初始化
  void initData() async {
    await Future.delayed(Duration(seconds: 1), () {
      _list = List.generate(10, (i) => "我是初始化的数据$i");
      setState(() {});
    });
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: RefreshIndicator(
          color: Colors.deepOrangeAccent,
          backgroundColor: Colors.white,
          child: ListView.builder(
            controller: _scrollController,
            itemCount: _list.length == 0
                ? 0
                : isLoading ? _list.length + 1 : _list.length,
            itemBuilder: (context, index) {
              return buildListItem(context, index);
            },
          ),
          onRefresh: _onRefresh),
    );
  }

  //刷新
  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 1), () {
      _list = List.generate(10, (i) => "我是刷新出的数据$i");
      setState(() {});
    });
  }

  //加载更多
  void _loadMore() async {
    if (!isLoading) {
      isLoading = true;
      setState(() {});
      Future.delayed(Duration(seconds: 1), () {
        isLoading = false;
        _list = List.from(_list);
        _list.addAll(List.generate(10, (index) => "上拉加载个数$index"));
        setState(() {});
      });
    }
  }

  //构建列表项
  Widget buildListItem(BuildContext context, int index) {
    if (index < _list.length) {
      return ListTile(
        title: Text(_list[index]),
      );
    }
    //最后一个是加载更多
    return _getMoreWidget();
  }

  //加载更多的组件
  Widget _getMoreWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 25,
              height: 25,
              child: CircularProgressIndicator(
                strokeWidth: 3,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: Text(
                '数据加载中...',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
