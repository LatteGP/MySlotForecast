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
    /** 店舗記録取得元URL */
    @Published var storeSourceUrl: String = ""
    
    /** 正しいURLなのかを検証 */
    func verifyStoreSourceUrl() -> Bool {
        return self.storeSourceUrl.contains(self.webSearchContent.verifyUrlSource())
    }
    
    /** 店舗記録を保存  */
    func saveStoreArchives(_ completion: (Bool) -> Void) {
        //
    }
}
