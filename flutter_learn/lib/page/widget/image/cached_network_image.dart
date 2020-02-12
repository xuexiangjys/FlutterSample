import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

///缓存图片
class CachedNetWorkImagePage extends StatefulWidget {
  final String title;
  CachedNetWorkImagePage(this.title, {Key key}) : super(key: key);
  @override
  _CachedNetWorkImagePageState createState() => _CachedNetWorkImagePageState();
}

class _CachedNetWorkImagePageState extends State<CachedNetWorkImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(children: <Widget>[
              _sizedContainer(
                Image(
                  image: CachedNetworkImageProvider(
                    'http://via.placeholder.com/350x150',
                  ),
                ),
              ),
              _sizedContainer(
                CachedNetworkImage(
                  placeholder: (context, url) => CircularProgressIndicator(),
                  imageUrl: 'http://via.placeholder.com/200x150',
                ),
              ),
              _sizedContainer(
                CachedNetworkImage(
                  imageUrl: 'http://via.placeholder.com/300x150',
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.red,
                          BlendMode.colorBurn,
                        ),
                      ),
                    ),
                  ),
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              _sizedContainer(
                CachedNetworkImage(
                  imageUrl: 'http://notAvalid.uri',
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              _sizedContainer(
                CachedNetworkImage(
                  imageUrl: 'not a uri at all',
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              _sizedContainer(
                CachedNetworkImage(
                  imageUrl: 'http://via.placeholder.com/350x200',
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fadeOutDuration: const Duration(seconds: 1),
                  fadeInDuration: const Duration(seconds: 3),
                ),
              ),
              _sizedContainer(ExtendedImage.network(
                "https://upload-images.jianshu.io/upload_images/7387168-37ff788eb2365082",
                cache: true,
                border: Border.all(color: Colors.red, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                // cancelToken: cancellationToken,
              ))
            ])));
  }

  Widget _sizedContainer(Widget child) => SizedBox(
        width: 300.0,
        height: 150.0,
        child: Center(child: child),
      );
}
