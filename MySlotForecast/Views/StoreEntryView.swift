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
                        .environmentObject(self.viewModel)
                        .transition(.move(edge: .bottom))
                } else {
                    Button(action: {
                        withAnimation {
                            self.viewModel.isActiveWebSearchView = true
                        }
                    }) {
                        Text("Webから探す")
                        Image(systemName: "rectangle.and.text.magnifyingglass")
                            .font(.title2)
                    }
                    Text(self.viewModel.storeName)
                        .padding(.vertical, 10)
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
