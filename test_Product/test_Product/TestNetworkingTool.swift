//
//  TestNetworkingTool.swift
//  test_Product
//
//  Created by 孟凡君 on 2020/12/14.
//

import UIKit
import HandyJSON
import Alamofire
import SwiftyJSON


class TestNetworkingTool: NSObject {

    private static func setHeader() ->HTTPHeaders {
        
        let Dic = Bundle.main.infoDictionary
        let versionStr = Dic?["CFBundleShortVersionString"] ?? "" //版本号
        var header:HTTPHeaders = HTTPHeaders.init()
        header["os"] = "ios"
        header["appname"] = "crm"
        header["version"] = versionStr as? String
        header["Content-Type"] = "application/json;charset=UTF-8"
        
        return header
    }
    
    /// 网络请求 get/post
    /// - Parameters:
    ///   - url: 链接
    ///   - method: get/post
    ///   - parameters: 参数列表
    ///   - showLoading: 是否显示loading true显示 false不显示
    ///   - succ: 请求成功 jsonStr:获取结果的json字符串。headerJsonStr:获取的header的json字符串 将返回的所有数据都返回过去，方便以后取responseHeader中的内容
    ///   - fail: 请求失败 errStr:经过处理的错误信息  err:未经整理的错误信息
    static func requestFun(url:String, method:HTTPMethod, parameters:Parameters?, showLoading :Bool = true, succ: @escaping (_ jsonStr: String, _ responseJson: DataResponse<String>) -> Void, fail: @escaping (_ errStr: String,_ err:Error)->()){
        
        if showLoading {//显示loading
            TestNetworkingTool.referenceCountChangeFun(isAdd: true)
        }
        
        var urlStr:String = url
        let header = self.setHeader()
        
        let encoding:ParameterEncoding = JSONEncoding.default
        
        if method == kHTTPMethodGet {
            let theStr:NSString = NSString.init(string: urlStr)
            urlStr = theStr.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        }
        
        TestNetManager.shareManager().request(urlStr, method: method, parameters: parameters, encoding: encoding, headers: header).responseString { (response) in
                
                if showLoading { //隐藏loading
                    TestNetworkingTool.referenceCountChangeFun(isAdd: false)
                }
            
                if response.result.isSuccess { //网络请求成功
//                    print("header=\(header) \rurlStr=\(urlStr) \rparaDic=\(parameters ?? [:]) \rresponse=\(JSON.init(parseJSON: response.result.value ?? ""))")
                    if let value = response.result.value {
//                        let json = JSON.init(parseJSON: value)
                        let json = JSON.init(parseJSON: response.result.value ?? "")
                        succ(value,response)
//                        if json["code"].int == 0 {//请求成功
//                            succ(value,response)
//                        }
//                        else{//请求失败，获取err
//                            fail(json["message"].string ?? kNetFailMessage, response.error ?? NSError.init())
//                        }
                        
                    }else{ //没有获取到数据
                        fail(kNetFailMessage, NSError.init())
                    }
                }else {//网络请求失败
                    fail(kNetFailMessage, NSError.init())
                }
        }
    }
    
    /// loading 管理
    /// - Parameter isAdd: 是否显示loading true引用计数加一 false引用计数减一
    private static func referenceCountChangeFun(isAdd:Bool) {
        if isAdd {
            KNetReferenceCount += 1
            DispatchQueue.main.async {
                TestLoading.shareInstance.show(title: "正在加载")
            }
        }else{
            KNetReferenceCount -= 1
            if KNetReferenceCount <= 0 {
                KNetReferenceCount = 0
                DispatchQueue.main.async {
                    TestLoading.shareInstance.dismissLoading()
                }
            }
        }
    }
    
    
}
