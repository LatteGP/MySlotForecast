//
//  WebSearchView.swift
//  MySlotForecast
//
//  Created by Latte on 2023/01/28.
//

import SwiftUI

struct WebSearchView: View {
    
    /** 親画面のビューモデル */
    @EnvironmentObject var parentViewModel: StoreEntryViewModel
    
    var body: some View {
        ZStack {
            Color(UIColor.secondarySystemBackground)
            VStack(spacing: 0) {
                WebView()
                    .environmentObject(self.parentViewModel)
                HStack(spacing: 0) {
                    if self.parentViewModel.sourceUrl.isEmpty {
                        // キャンセルボタン
                        Button("キャンセル") {
                            withAnimation {
                                self.parentViewModel.isActiveWebSearchView = false
                            }
                        }
                        .bold()
                        .font(.subheadline)
                        .foregroundColor(.red)
                    } else {
                        // 選択ボタン
                        Button(action: {
                            withAnimation {
                                self.parentViewModel.isActiveWebSearchView = false
                            }
                        }){
                            Image(systemName: "checkmark.circle.fill")
                            Text("選択")
                        }
                        .bold()
                        .font(.subheadline)
                        .foregroundColor(.green)
                    }
                }
                .frame(height: 60)
            }
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
