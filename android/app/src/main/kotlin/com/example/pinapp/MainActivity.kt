package com.example.pinapp

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import okhttp3.OkHttpClient
import okhttp3.Request
import org.json.JSONArray
import java.io.IOException

class MainActivity : FlutterActivity() {

    private val CHANNEL = "com.pinapp.comments"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getComments") {
                val postId = call.argument<Int>("postId")
                if (postId != null) {
                    fetchComments(postId) { comments, error ->
                        if (error != null) {
                            result.error("ERROR", error.message, null)
                        } else {
                            result.success(comments)
                        }
                    }
                } else {
                    result.error("INVALID_ARGUMENT", "PostId not provided", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    private fun fetchComments(postId: Int, callback: (List<Map<String, Any>>?, Exception?) -> Unit) {
        val client = OkHttpClient()
        val url = "https://jsonplaceholder.typicode.com/comments?postId=$postId"
        val request = Request.Builder().url(url).build()

        client.newCall(request).enqueue(object : okhttp3.Callback {
            override fun onFailure(call: okhttp3.Call, e: IOException) {
                callback(null, e)
            }

            override fun onResponse(call: okhttp3.Call, response: okhttp3.Response) {
                response.use {
                    if (!it.isSuccessful) {
                        callback(null, IOException("Unexpected code $response"))
                        return
                    }
                    val body = it.body?.string()
                    if (body != null) {
                        val jsonArray = JSONArray(body)
                        val comments = mutableListOf<Map<String, Any>>()
                        for (i in 0 until jsonArray.length()) {
                            val obj = jsonArray.getJSONObject(i)
                            val map = mutableMapOf<String, Any>()
                            obj.keys().forEach { key ->
                                map[key] = obj.get(key)
                            }
                            comments.add(map)
                        }
                        callback(comments, null)
                    } else {
                        callback(null, IOException("Empty response body"))
                    }
                }
            }
        })
    }
}