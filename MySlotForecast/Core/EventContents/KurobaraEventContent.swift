//
//  KurobaraEventContent.swift
//  MySlotForecast
//
//  Created by Latte on 2023/02/20.
//

import Foundation
import WebKit

class KurobaraEventContent: EventContent {
    
    /** イベント名 */
    var name: String = "黒バラの極意"
    /** トップページURL */
    var entranceUrl: String = "https://www.google.com/"
    /** 検証URL */
    var verifyUrl: String = "https://www.google.com/"
    /** ソースURL */
    var sourceUrl: String = ""
    
    /** ソース解析 */
    func analyzeSource(_ source: [String]) -> [String] {
        return []
    }
    
    /** 店舗名解析 */
    func analyzeStoreName(_ webView: WKWebView, _ completion: @escaping (String?) -> Void) {
        //
    }
    
}
