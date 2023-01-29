//
//  StoreViewModel.swift
//  MySlotForecast
//
//  Created by Latte on 2023/01/28.
//

import Foundation

class StoreEntryViewModel: ObservableObject {
    
    /** Web検索画面アクティブフラグ */
    @Published var isActiveWebSearchView: Bool = false
    /** 検索対象のコンテンツ */
    @Published var webSearchContent = WebSearchContents.PREVIEW
    /** 店舗記録ソースURL */
    @Published var sourceUrl: String = ""
    
    /** 店舗記録ソースURLなのかを検証 */
    func verifySourceUrl(_ urlSring: String) {
        guard urlSring.contains(self.webSearchContent.verifyUrlSource()) else {
            self.sourceUrl = ""
            return
        }
        self.sourceUrl = urlSring
    }
    
    /** 店舗記録を保存  */
    func saveStoreArchives(_ completion: (Bool) -> Void) {
        //
    }
}
