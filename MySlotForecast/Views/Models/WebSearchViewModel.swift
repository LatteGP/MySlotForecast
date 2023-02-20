//
//  WebSearchViewModel.swift
//  MySlotForecast
//
//  Created by Latte on 2023/01/29.
//

import Foundation
import WebKit

class WebSearchViewModel: WebView.Coordinator, ObservableObject {
    
    /** 親ビューモデル */
    private var parent: StoreEntryViewModel!
    /** WebViewロードフラグ */
    @Published var isLoadingWebView: Bool = true
    
    /** 親ビューモデルをセット */
    func setParentViewModel(_ parent: StoreEntryViewModel) {
        self.parent = parent
    }
    
    /** ソース解析 */
    func analyzeSource(_ webView: WKWebView) {
        // 店舗名とソースURLを初期化
        self.parent.storeName = ""
        self.parent.eventContent.sourceUrl = ""
        // WebViewからURLを取得
        let webUrl = webView.url?.absoluteString ?? ""
        // 検証URLを取得
        let verifyUrl = self.parent.eventContent.verifyUrl
        // URLを検証
        guard webUrl.contains(verifyUrl) else {
            return
        }
        // 店舗名を取得
        self.parent.eventContent.analyzeStoreName(webView) { result in
            // 結果のガード
            guard result != nil else {
                return
            }
            // 店舗名とソースURLをセット
            self.parent.storeName = result!
            self.parent.eventContent.sourceUrl = webUrl
        }
    }
    
    /** ページ表示処理開始 */
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        //
    }
    
    /** ページ表示処理完了  */
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // ロード画面を非表示(初回)
        self.isLoadingWebView = false
        // ソース解析
        self.analyzeSource(webView)
    }
    
}

