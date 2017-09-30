//
//  ViewController.swift
//  TestSwift
//
//  Created by ZJ on 12/09/2017.
//  Copyright © 2017 HY. All rights reserved.
//

import UIKit

class ViewController: UIViewController, URLSessionDelegate, URLSessionTaskDelegate, URLSessionDataDelegate, URLSessionDownloadDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        UIImage.createImage(color: <#T##UIColor#>, frame: <#T##CGRect#>)
        let imageView = UIImageView.init(image: image)
        imageView.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        imageView.contentMode = .scaleAspectFit
        self.view.addSubview(imageView)
//        self.downloadTaskTest()
    }
    
    func getRequest1() -> Void {
        // 1.请求路径
        let url = URL(string: "http://api.rhintouch.cn/api/ring/html/getAppShare?language=zh&mobileType=2&version=9012")
        
        // 2.创建请求对象
        let request = URLRequest(url: url!)
        
        // 3.创建请求任务
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if(error == nil){
                // 解析服务器返回的数据
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                    print (json!)
                } catch{
                    print(error)
                }
            }
        }
        
        // 4.启动任务
        dataTask.resume()
    }
    
    func getRequest2() -> Void {
        // 1.请求路径
        let url = URL(string: "http://api.rhintouch.cn/api/ring/html/getAppShare?language=zh&mobileType=2&version=9012")
        
        /*
            注意：
            1）该方法内部会自动将请求路径包装成一个请求对象，该请求对象默认包含了请求头信息和请求方法（GET）
            2）如果要发送的是POST请求，则不能使用该方法
         */
        // 2.创建请求任务
        let dataTask = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if(error == nil){
                // 解析服务器返回的数据
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                    print (json!)
                } catch{
                    print(error)
                }
            }
        }
        
        // 3.启动任务
        dataTask.resume()
    }
    
    func postRequest() -> Void {
        // 1.请求路径
        let url = URL(string: "http://api.rhintouch.cn/api/ring/user/register")
        
        // 2.创建请求对象
        var request = URLRequest(url: url!)
        
        // 3.设置请求方法类型
        request.httpMethod = "POST"
        
        // 4.设置请求体
        request.httpBody = "isDev=1&language=zh&mobileType=2&password=111111&pushDeveiceId=3339d3be45a14492aabbbbccd8f2550b&pushType=1&userName=333333&version=0912".data(using: String.Encoding.utf8)
        
        // 5.创建请求任务
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if(error == nil) {
                // 解析服务器返回的数据
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                    print (json!)
                } catch{
                    print(error)
                }
            }
        }
        
        // 6.启动任务
        dataTask.resume()
    }

    func delegateTest() -> Void {
        // 1.请求路径
        let url = URL(string: "http://api.rhintouch.cn/api/ring/html/getAppShare?language=zh&mobileType=2&version=9012")
        
        // 2.创建请求对象
        let request = URLRequest(url: url!)
        
        // 3.创建请求任务
         let dataTask = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil).dataTask(with: request)
        
        // 4.启动任务
        dataTask.resume()
    }
    
    //MARK: URLSessionDelegate

    public func urlSession(_ session: URLSession, didBecomeInvalidWithError error: Error?) {
        print(#function)
    }
    
    public func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Swift.Void) {
        print(#function)
    }
    
    public func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
        print(#function)
    }
    
    //MARK: - URLSessionTaskDelegate
    
    // 3.当请求完成(成功|失败)的时候会调用该方法，如果请求失败，则error有值
    public func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        print(#function)
    }

    //MARK: - URLSessionDataDelegate
    
    // 1.接收到服务器响应的时候调用该方法
    public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Swift.Void) {
        print(#function)
    }
    
    // 2.接收到服务器返回数据的时候会调用该方法，如果数据较大那么该方法可能会调用多次
    public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        print(#function)
    }
    
    func downloadTaskTest() -> Void {
        // 1.请求路径
        let url = URL(string: "http://hangge.com/blog/images/logo.png")
        
        // 2.创建请求对象
        let request = URLRequest(url: url!)
        
        // 3.创建请求任务
         let dataTask = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil).downloadTask(with: request)
        
        // 4.启动任务
        dataTask.resume()
    }
    
    //MARK: - URLSessionDownloadDelegate

    //下载代理方法，下载结束
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        //下载结束
        print("下载结束")
        
        //输出下载文件原来的存放目录
        print("location:\(location)")
        // location位置转换
        let locationPath = location.path
        print("path:\(locationPath)")
        //拷贝到用户目录
        let documnets:String = NSHomeDirectory() + "/Documents/2.png"
        //创建文件管理器
//        let fileManager = FileManager.default
//        try! fileManager.moveItem(atPath: locationPath, toPath: documnets)
        print("new location:\(documnets)")
        do {
            let data = try Data.init(contentsOf: location)
            let image = UIImage.init(data: data)
            DispatchQueue.main.async {
                let imageView = UIImageView.init(image: image)
                imageView.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
                imageView.contentMode = .scaleAspectFit
                self.view.addSubview(imageView)
            }
        } catch {
            print(error)
        }
    }
    
    //下载代理方法，监听下载进度
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        //获取进度
        let written:CGFloat = (CGFloat)(totalBytesWritten)
        let total:CGFloat = (CGFloat)(totalBytesExpectedToWrite)
        let pro:CGFloat = written/total
        print("下载进度：\(pro)")
    }
    
    //下载代理方法，下载偏移
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didResumeAtOffset fileOffset: Int64, expectedTotalBytes: Int64) {
        //下载偏移，主要用于暂停续传
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
//        request.httpMethod = "GET";
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
