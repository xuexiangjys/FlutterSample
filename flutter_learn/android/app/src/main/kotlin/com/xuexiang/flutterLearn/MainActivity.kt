package com.xuexiang.flutterLearn

import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import com.umeng.analytics.MobclickAgent

class MainActivity: FlutterActivity() {
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)
  }

  override fun onResume() {
    super.onResume()
    MobclickAgent.onResume(this)
  }

  override fun onPause() {
    super.onPause()
    MobclickAgent.onPause(this)
  }
}
