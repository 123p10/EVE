package eve.eve01

import android.os.Bundle
import android.widget.Toast
import android.telephony.SmsManager
import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import android.support.v4.content.ContextCompat
import android.Manifest
import android.content.pm.PackageManager
import android.support.v4.app.ActivityCompat
import android.util.Log

class MainActivity(): FlutterActivity() {
    private val CHANNEL = "eve.messenger/sms"


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)
        if(ContextCompat.checkSelfPermission(this@MainActivity,Manifest.permission.READ_SMS) != PackageManager.PERMISSION_GRANTED) {
            ActivityCompat.requestPermissions(this@MainActivity,
                    arrayOf(Manifest.permission.READ_SMS),1)
        }
        if(ContextCompat.checkSelfPermission(this@MainActivity,Manifest.permission.READ_PHONE_STATE) != PackageManager.PERMISSION_GRANTED) {
            ActivityCompat.requestPermissions(this@MainActivity,
                    arrayOf(Manifest.permission.READ_PHONE_STATE),1)
        }

        MethodChannel(flutterView,CHANNEL).setMethodCallHandler{
            call, result ->
            if(call.method == "sendSMS"){

                if(ContextCompat.checkSelfPermission(this@MainActivity,Manifest.permission.SEND_SMS) == PackageManager.PERMISSION_GRANTED) {
                    sendSMS(call.argument("text"))
                }
                else{
                    ActivityCompat.requestPermissions(this@MainActivity,
                            arrayOf(Manifest.permission.SEND_SMS),1)
                }

            }

        }
    }
    private fun sendSMS(text : String){

        val phoneNo : String = "7097038408"
        try {
            val smsManager = SmsManager.getDefault()
            smsManager.sendTextMessage(phoneNo, null, text, null, null)
            Toast.makeText(getApplicationContext(), "Message Sent",
                    Toast.LENGTH_LONG).show()
        } catch (ex: Exception) {
            Toast.makeText(getApplicationContext(), ex.message.toString(),
                    Toast.LENGTH_LONG).show()
            ex.printStackTrace()
        }

    }
}
