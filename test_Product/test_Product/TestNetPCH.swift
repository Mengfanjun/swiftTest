//
//  testNetPCH.swift
//  test_Product
//
//  Created by 孟凡君 on 2020/12/14.
//

import UIKit
import SnapKit
import Alamofire

let kHTTPMethodGet:HTTPMethod = HTTPMethod.get
let kHTTPMethodPost:HTTPMethod = HTTPMethod.post
let kNetFailMessage = "请检查网络"
let kScreenWidth = UIScreen.main.bounds.size.width
let kScreenHeight = UIScreen.main.bounds.size.height
var KNetReferenceCount:Int = 0

//这里的375我是针对6为标准适配的,如果需要其他标准可以修改
func kWidthScale(_ R:CGFloat) -> CGFloat {
    return ((R)*(kScreenWidth/375.0))
}
