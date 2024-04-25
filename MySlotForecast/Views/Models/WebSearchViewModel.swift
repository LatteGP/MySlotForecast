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
            self.webView = webView
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
    
    private var webView: WKWebView!
    
    public func close() {
        
        // スクリプト
        let script = """
            let doms = document.getElementsByClassName('table_wrap')[0];
            let table = doms.getElementsByTagName('table')[0];
            let data = [];
            for (let i = 0; i < table.rows.length; i++) {
                let row = table.rows[i];
                let rowData = [];
                for (let j = 0; j < row.cells.length; j++) {
                    let cell = row.cells[j];
                    rowData.push(cell.innerText);
                }
                data.push(rowData);
            }
            data;
        """
        
        // 解析実行
        webView.evaluateJavaScript(script) { (result, error) in
            // エラー
            guard error == nil else {
                print(error!)
                return
            }
            if let csvString = self.generateCsvStringFromJavaScriptResult(result) {
                print(csvString)
            } else {
                print("Failed to generate CSV string from JavaScript result.")
            }
        }
    }
    
    func generateCsvStringFromJavaScriptResult(_ result: Any?) -> String? {
        guard let resultArray = result as? [[String]] else {
            print("JavaScript result is not in the expected format.")
            return nil
        }

        var csvString = ""

        for row in resultArray {
            let rowString = row.map { "\"\($0.replacingOccurrences(of: "\"", with: "\"\""))\"" }.joined(separator: ",")
            csvString.append(rowString)
            csvString.append("\n")
        }

        return csvString
    }
    
}


