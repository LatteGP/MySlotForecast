//
//  MinrepoEventContent.swift
//  MySlotForecast
//
//  Created by Latte on 2023/02/20.
//

import Foundation
import WebKit

class MinrepoEventContent: EventContent {
    
    /** イベント名 */
    var name: String = "みんレポ"
    /** トップページURL */
    var entranceUrl: String = "https://min-repo.com/"
    /** 検証URL */
    var verifyUrl: String = "https://min-repo.com/"
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
