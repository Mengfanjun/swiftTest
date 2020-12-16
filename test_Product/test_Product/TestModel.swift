//
//  TestModel.swift
//  test_Product
//
//  Created by 孟凡君 on 2020/12/14.
//

import UIKit
import HandyJSON
import SwiftyJSON

class TestModel: HandyJSON {
    
    var current_user_url:String = ""
    var current_user_authorizations_html_url:String = ""
    var code_search_url:String = ""
    var commit_search_url:String = ""
    var emails_url:String = ""
    var emojis_url:String = ""
    var events_url:String = ""
    var feeds_url:String = ""
    var followers_url:String = ""
    var following_url:String = ""
    var gists_url:String = ""
    var hub_url:String = ""
    var issues_url:String = ""
    var keys_url:String = ""

    
    var cache:Bool = false
    
    //HandyJSON要求必须实现这个方法
    required init() {

    }
    
    /// 获取个人信息
    static func requestFun(succ: @escaping(_ arr:Array<Any
    >) -> (), fail: @escaping (_ errStr: String) -> ()) {
        
        TestNetworkingTool.requestFun(url: "https://api.github.com/", method: kHTTPMethodGet, parameters: nil, showLoading: false, succ: { (responseData, response) in
//            print("\response TestModel=\(String(responseData))")
            var someArray = [Any]()
//            succ([TestModel].deserialize(from: responseData, designatedPath: "TestModel") as? Array<TestModel> ?? Array.init())
            if let object = TestModel.deserialize(from: responseData) {
                
                let urlDict:[String:String] = ["key" :"current_user_url","value":object.code_search_url]
                someArray.append(urlDict)
                
                let html_urlDict:[String:String] = ["key" :"current_user_authorizations_html_url","value":object.current_user_authorizations_html_url]
                someArray.append(html_urlDict)
                
                let search_urlDict:[String:String] = ["key" :"code_search_url","value":object.code_search_url]
                someArray.append(search_urlDict)
                
                let commit_urlDict:[String:String] = ["key" :"commit_search_url","value":object.commit_search_url]
                someArray.append(commit_urlDict)
                
                let emails_urlDict:[String:String] = ["key" :"emails_url","value":object.emails_url]
                someArray.append(emails_urlDict)
                
                let emojis_urlDict:[String:String] = ["key" :"emojis_url","value":object.emojis_url]
                someArray.append(emojis_urlDict)
                
                let events_urlDict:[String:String] = ["key" :"events_url","value":object.events_url]
                someArray.append(events_urlDict)
                
                let feeds_urlDict:[String:String] = ["key" :"feeds_url","value":object.feeds_url]
                someArray.append(feeds_urlDict)
                
                let followers_urlDict:[String:String] = ["key" :"followers_url","value":object.followers_url]
                someArray.append(followers_urlDict)
                
                let following_urlDict:[String:String] = ["key" :"following_url","value":object.following_url]
                someArray.append(following_urlDict)
                
                let gists_urlDict:[String:String] = ["key" :"gists_url","value":object.gists_url]
                someArray.append(gists_urlDict)
                
                let hub_urlDict:[String:String] = ["key" :"hub_url","value":object.hub_url]
                someArray.append(hub_urlDict)
                
                let issues_urlDict:[String:String] = ["key" :"issues_url","value":object.issues_url]
                someArray.append(issues_urlDict)
                
                let keys_urlDict:[String:String] = ["key" :"keys_url","value":object.keys_url]
                someArray.append(keys_urlDict)
            }
            
            succ(someArray)
        }) { (errStr, err) in
            fail(errStr)
        }
    }
    
}
