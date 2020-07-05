import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodePage extends StatefulWidget {
  final String title;
  QRCodePage(this.title, {Key key}) : super(key: key);
  @override
  _QRCodePageState createState() => _QRCodePageState();
}

const flashOn = '闪光灯开';
const flashOff = '闪光灯关';
const frontCamera = '前置摄像头';
const backCamera = '后置摄像头';

class _QRCodePageState extends State<QRCodePage> {
  var qrText = '';
  var flashState = flashOn;
  var cameraState = frontCamera;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                  borderColor: Colors.red,
                  borderRadius: 10,
                  borderLength: 30,
                  borderWidth: 10,
                  cutOutSize: 300,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('扫码结果: $qrText'),
                    ButtonBar(
                      alignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          child: RaisedButton(
                            onPressed: () {
                              if (controller != null) {
                                controller.toggleFlash();
                                if (_isFlashOn(flashState)) {
                                  setState(() {
                                    flashState = flashOff;
                                  });
                                } else {
                                  setState(() {
                                    flashState = flashOn;
                                  });
                                }
                              }
                            },
                            child: Text(flashState,
                                style: TextStyle(fontSize: 20)),
                          ),
                        ),
                        Container(
                          child: RaisedButton(
                            onPressed: () {
                              if (controller != null) {
                                controller.flipCamera();
                                if (_isBackCamera(cameraState)) {
                                  setState(() {
                                    cameraState = frontCamera;
                                  });
                                } else {
                                  setState(() {
                                    cameraState = backCamera;
                                  });
                                }
                              }
                            },
                            child: Text(cameraState,
                                style: TextStyle(fontSize: 20)),
                          ),
                        )
                      ],
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          child: RaisedButton(
                            onPressed: () {
                              controller?.pauseCamera();
                            },
                            child: Text('暂停', style: TextStyle(fontSize: 20)),
                          ),
                        ),
                        Container(
                          child: RaisedButton(
                            onPressed: () {
                              controller?.resumeCamera();
                            },
                            child: Text('恢复', style: TextStyle(fontSize: 20)),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  bool _isFlashOn(String current) {
    return flashOn == current;
  }

  bool _isBackCamera(String current) {
    return backCamera == current;
  }

  ///二维码扫描界面加载完毕
  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
