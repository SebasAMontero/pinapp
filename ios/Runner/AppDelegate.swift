import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
    
    private let channelName = "com.pinapp.comments"  
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        GeneratedPluginRegistrant.register(with: self)
        
        if let controller = window?.rootViewController as? FlutterViewController {
            let commentsChannel = FlutterMethodChannel(
                name: channelName,
                binaryMessenger: controller.binaryMessenger
            )
            
            commentsChannel.setMethodCallHandler { (call, result) in
                if call.method == "getComments" {
                    if let args = call.arguments as? [String: Any],
                       let postId = args["postId"] as? Int {
                        self.fetchComments(postId: postId) { comments, error in
                            if let error = error {
                                result(FlutterError(
                                    code: "ERROR",
                                    message: error.localizedDescription,
                                    details: nil
                                ))
                            } else {
                                result(comments)
                            }
                        }
                    } else {
                        result(FlutterError(
                            code: "INVALID_ARGUMENT",
                            message: "PostId not provided",
                            details: nil
                        ))
                    }
                } else {
                    result(FlutterMethodNotImplemented)
                }
            }
        }
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    

    private func fetchComments(postId: Int, completion: @escaping ([[String: Any]]?, Error?) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/comments?postId=\(postId)"
        guard let url = URL(string: urlString) else {
            completion(nil, NSError(domain: "Invalid URL", code: 0))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NSError(domain: "No data", code: 0))
                return
            }
            
            do {
                if let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                    completion(jsonArray, nil)
                } else {
                    completion(nil, NSError(domain: "Invalid JSON format", code: 0))
                }
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
}