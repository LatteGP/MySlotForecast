//
//  StoreEntryView.swift
//  MySlotForecast
//
//  Created by Latte on 2023/01/28.
//

import SwiftUI

struct StoreEntryView: View {
    
    /** 店舗記録エントリー画面のビューモデル */
    @StateObject var viewModel = StoreEntryViewModel()
    
    var body: some View {
        ZStack {
            Color(UIColor.secondarySystemBackground)
            VStack {
                if self.viewModel.isActiveWebSearchView {
                    WebSearchView()
                        .transition(.move(edge: .bottom))
                        .environmentObject(self.viewModel)
                } else {
                    Button(action: {
                        withAnimation {
                            self.viewModel.webSearchContent = WebSearchContents.AIMS
                            self.viewModel.isActiveWebSearchView = true
                        }
                    }) {
                        Text("Webから探す")
                        Image(systemName: "rectangle.and.text.magnifyingglass")
                            .font(.title2)
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct StoreEntryView_Previews: PreviewProvider {
    static var previews: some View {
        StoreEntryView()
    }
}
