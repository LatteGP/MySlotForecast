//
//  WebView.swift
//  MySlotForecast
//
//  Created by Latte on 2023/01/28.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    /** 初期表示URL */
    let webUrl: String
    /** WebViewコーディネータ */
    let coordinator: WebView.Coordinator
    
    /** UIView初期化 */
    func makeUIView(context: Context) -> WKWebView {
        // WkWebViewの初期化
        let webView = WKWebView()
        // デリゲートを設定
        webView.uiDelegate = context.coordinator
        webView.navigationDelegate = context.coordinator
        // スワイプ操作を許可
        webView.allowsBackForwardNavigationGestures = true
        // リンクプレビューを許可しない
        webView.allowsLinkPreview = false
        // 初期表示URLの設定
        let url = URL(string: self.webUrl)!
        let request = URLRequest(url: url)
        webView.load(request)
        return webView
    }
    
    /** UIView更新 */
    func updateUIView(_ wkWebView: WKWebView, context: Context) {
        //
    }
    
    /** UIViewコーディネーター */
    func makeCoordinator() -> Coordinator {
        self.coordinator
    }
}

extension WebView {
    /** WebViewコーディネータベースクラス */
    class Coordinator: NSObject, WKUIDelegate, WKNavigationDelegate {
        //
    }
}
