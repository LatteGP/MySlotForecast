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
    @Published var eventContent = RawEventContents.PREVIEW.instance()
    /** 店舗名 */
    @Published var storeName = ""
    
    /** 店舗記録を保存  */
    func saveStoreArchives(_ completion: (Bool) -> Void) {
        //
    }
}
