package com.example.flutter_demo1

import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
  override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        BatteryChannel(flutterEngine.dartExecutor.binaryMessenger,context)  // 实例化通道
    }
}

class BatteryChannel(flutterEngine: BinaryMessenger, context: Context): MethodChannel.MethodCallHandler {
    private val batteryChannelName = "cn.blogss/battery"
    private var channel: MethodChannel
    private var mContext: Context
 
    companion object {
        private const val TAG = "BatteryChannel"
    }
 
    init {
        Log.d(TAG, "init")
        channel = MethodChannel(flutterEngine, batteryChannelName)
        channel.setMethodCallHandler(this)
        mContext = context;
    }
 
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        Log.d(TAG, "onMethodCall: " + call.method)
        if (call.method == "getBatteryLevel") {
            val batteryLevel = getBatteryLevel()
            if (batteryLevel != -1) {
                result.success(batteryLevel)
            } else {
                result.error("UNAVAILABLE", "Battery level not available.", null)
            }
        } else {
            result.notImplemented()
        }
    }
 
    private fun getBatteryLevel(): Int {
        val batteryLevel: Int
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            val batteryManager = mContext.getSystemService(Context.BATTERY_SERVICE) as BatteryManager
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        } else {
            val intent = ContextWrapper(mContext).registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
            batteryLevel = intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) *
                    100 / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
        }
 
        return batteryLevel
    }
}