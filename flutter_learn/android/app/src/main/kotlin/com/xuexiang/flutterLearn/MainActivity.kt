package com.xuexiang.flutterLearn

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.umeng.analytics.MobclickAgent

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
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
