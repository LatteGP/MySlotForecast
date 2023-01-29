//
//  WebSearchUrls.swift
//  MySlotForecast
//
//  Created by Latte on 2023/01/28.
//

import Foundation

enum WebSearchContents {
    /** みんレポ */
    case MINREPO
    /** エイムスター */
    case AIMS
    /** 黒バラ */
    case KUROBARA
    /** プレビュー(テスト)  */
    case PREVIEW
    
    /** String型のURLを返す */
    func utlString() -> String {
        switch(self) {
        case .MINREPO:
            return "https://min-repo.com/"
        case .AIMS:
            return "https://aims777.com/"
        case .KUROBARA:
            return "https://www.google.com/"
        case .PREVIEW:
            return "https://aims777.com/"
        }
    }
    
    func verifyUrlSource() -> String {
        switch(self) {
        case .AIMS:
            return "https://aims777.com/hall_tax/h-"
        default:
            return "https://www.google.com/"
        }
    }
}
