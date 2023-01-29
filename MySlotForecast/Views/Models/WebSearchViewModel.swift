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
    
    /** 店舗記録ソースURLなのかを検証 */
    func verifySourceUrl(_ urlSring: String) {
        // ソースURLを取得
        let baseUrl = self.parent.webSearchContent.verifyUrlSource()
        // URLを確認
        guard urlSring.contains(baseUrl) else {
            self.parent.sourceUrl = ""
            return
        }
        self.parent.sourceUrl = urlSring
    }
    
    /** ページ表示処理開始 */
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        // ロード画面を表示
        self.isLoadingWebView = true
    }
    
    /** ページ表示処理完了  */
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // ロード画面を非表示
        self.isLoadingWebView = false
        // URLを取得
        let urlString = webView.url?.absoluteString ?? ""
        // URLを検証する
        self.verifySourceUrl(urlString)
    }
    
}

