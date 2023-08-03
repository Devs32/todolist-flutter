package com.example.todolist_flutter

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
  private val closedChannel = "tyger/closed";

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)

    MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, closedChannel).setMethodCallHandler { call, result ->
      if (call.method == "close") {
          finish()
      }
    }
  }
}
