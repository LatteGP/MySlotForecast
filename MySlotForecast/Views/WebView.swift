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
    
    /** 親画面のビューモデル */
    @EnvironmentObject var parentViewModel: StoreEntryViewModel
    
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
        let url = URL(string: self.parentViewModel.webSearchContent.utlString())!
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
        Coordinator(self.parentViewModel)
    }
}

extension WebView {
    class Coordinator: NSObject, WKUIDelegate, WKNavigationDelegate {
        
        var viewModel: StoreEntryViewModel
        
        init(_ viewModel: StoreEntryViewModel) {
            self.viewModel = viewModel
        }
        
        /** ページ表示処理完了  */
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            // URLを検証する
            let urlString = webView.url?.absoluteString ?? ""
            self.viewModel.verifySourceUrl(urlString)
        }
    }
}
