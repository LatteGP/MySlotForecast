//
//  WebSearchView.swift
//  MySlotForecast
//
//  Created by Latte on 2023/01/28.
//

import SwiftUI

struct WebSearchView: View {
    
    /** 親ビューモデル */
    @EnvironmentObject var parentViewModel: StoreEntryViewModel
    /** Web検索画面のビューモデル */
    @StateObject var viewModel = WebSearchViewModel()
    
    var body: some View {
        ZStack {
            Color(UIColor.secondarySystemBackground)
            VStack(spacing: 0) {
                ZStack {
                    WebView(
                        webUrl: self.parentViewModel.webSearchContent.utlString(),
                        coordinator: self.viewModel
                    )
                    .opacity(self.viewModel.isLoadingWebView ? 0.2 : 1.0)
                    
                    if self.viewModel.isLoadingWebView {
                        ProgressView("Loading")
                            .font(.subheadline)
                    }
                    
                }
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
        .onAppear {
            self.viewModel.setParentViewModel(self.parentViewModel)
        }
    }
}

struct WebSearchView_Previews: PreviewProvider {
    static var previews: some View {
        WebSearchView()
            .environmentObject(StoreEntryViewModel())
    }
}
