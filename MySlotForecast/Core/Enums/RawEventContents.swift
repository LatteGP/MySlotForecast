//
//  RawEventContents.swift
//  MySlotForecast
//
//  Created by Latte on 2023/02/20.
//

import Foundation

enum RawEventContents {
    /** プレビュー */
    case PREVIEW
    /** みんレポ */
    case MINREPO
    /** エイムスター */
    case AIMS
    /** 黒バラ */
    case KUROBARA
    
    /** イベントコンテンツ全件を返す */
    static func all() -> [RawEventContents] {
        return [
            .PREVIEW,
            .MINREPO,
            .AIMS,
            .KUROBARA,
        ]
    }
    
    /** インスタンスを返す */
    func instance() -> EventContent {
        switch(self) {
        case .MINREPO:
            return MinrepoEventContent()
        case .AIMS:
            return AimsEventContent()
        case .KUROBARA:
            return KurobaraEventContent()
        case .PREVIEW:
            return AimsEventContent()
        }
    }
    
}
