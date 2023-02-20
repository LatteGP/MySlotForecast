//
//  PreviewEventContent.swift
//  MySlotForecast
//
//  Created by Latte on 2023/02/20.
//

import Foundation
import WebKit

class AimsEventContent: EventContent {
    
    /** イベント名 */
    var name: String = "エイムスター"
    /** トップページURL */
    var entranceUrl: String = "https://aims777.com/"
    /** 検証URL */
    var verifyUrl: String = "https://aims777.com/hall_tax/h-"
    /** ソースURL */
    var sourceUrl: String = ""
    
    /** ソース解析 */
    func analyzeSource(_ source: [String]) -> [String] {
        return []
    }
    
    /** 店舗名解析 */
    func analyzeStoreName(_ webView: WKWebView, _ completion: @escaping (String?) -> Void) {
        // スクリプト
        let script = "document.getElementsByClassName('p-single-hall__title')[0].innerText"
        // 解析実行
        webView.evaluateJavaScript(script) { (result, error) in
            // エラー
            guard error == nil else {
                completion(nil)
                return
            }
            // 店舗名を返す
            completion(result as? String)
        }
    }
    
}
