package com.example.join_party

import io.flutter.embedding.android.FlutterActivity
import com.yandex.mapkit.MapKitFactory
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
     override public fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("387b31cb-69ec-4a00-9dfc-5ca5b5889c05")
        GeneratedPluginRegistrant.registerWith(flutterEngine)
    }
}