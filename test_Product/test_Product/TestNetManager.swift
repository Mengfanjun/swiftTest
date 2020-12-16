//
//  TestNetManager.swift
//  test_Product
//
//  Created by 孟凡君 on 2020/12/14.
//

import UIKit
import Alamofire

/// 网络配置单例类
class TestNetManager: SessionManager {
    static var theManager:TestNetManager?
    
    class func shareManager(timeOutFlo:TimeInterval = 60) -> TestNetManager {
        let config = Config.shareConfig()
        config.timeoutIntervalForRequest = timeOutFlo
        if theManager == nil{
            theManager = TestNetManager.init(configuration: config)
        }

        return theManager!
    }
}

/// 网络配置单例类
class Config: URLSessionConfiguration {
    static var theConfig:URLSessionConfiguration?
    class func shareConfig() -> URLSessionConfiguration {
        if theConfig == nil {
            theConfig = URLSessionConfiguration.default
        }
        return theConfig!
    }
}

