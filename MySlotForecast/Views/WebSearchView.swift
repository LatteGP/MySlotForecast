//
//  WebSearchView.swift
//  MySlotForecast
//
//  Created by Latte on 2023/01/28.
//

import SwiftUI

struct WebSearchView: View {
    
    /** 店舗記録エントリー画面のビューモデル */
    @EnvironmentObject var parentViewModel: StoreEntryViewModel
    /** Web検索画面のビューモデル */
    @StateObject var viewModel = WebSearchViewModel()
    
    var body: some View {
        ZStack {
            Color(UIColor.secondarySystemBackground)
            VStack(spacing: 0) {
                WebView()
                    .environmentObject(self.parentViewModel)
                HStack(spacing: 0) {
                    Button(action: {
                        withAnimation {
                            if self.parentViewModel.verifyStoreSourceUrl() {
                                self.parentViewModel.isActiveWebSearchView = false
                            } else {
                                self.viewModel.isActiveAlert = true
                            }
                        }
                    }){
                        Image(systemName: "checkmark.circle")
                    }
                    .font(.largeTitle)
                    .foregroundColor(.green)
                }
                .padding(.vertical)
            }
        }
        .alert(isPresented: self.$viewModel.isActiveAlert) {
            Alert(title: Text("エラー"), message: Text("このページから店舗情報を\n取得することができませんでした。\n店舗の取材結果一覧ページで\nもう一度お試しください。"))
        }
        .preferredColorScheme(.dark)
    }
}

struct WebSearchView_Previews: PreviewProvider {
    static var previews: some View {
        WebSearchView()
            .environmentObject(StoreEntryViewModel())
    }
}
