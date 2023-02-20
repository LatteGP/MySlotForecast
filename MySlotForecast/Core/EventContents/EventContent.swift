//
//  EventContents.swift
//  MySlotForecast
//
//  Created by Latte on 2023/02/20.
//

import Foundation
import WebKit

protocol EventContent {
    /** イベント名 */
    var name: String { get }
    /** トップページURL */
    var entranceUrl: String { get }
    /** 検証URL */
    var verifyUrl: String { get }
    /** ソースURL */
    var sourceUrl: String { get set }
    /** ソース解析 */
    func analyzeSource(_ source: [String]) -> [String]
    /** 店舗名解析 */
    func analyzeStoreName(_ webView: WKWebView, _ completion: @escaping (String?) -> Void)
}
