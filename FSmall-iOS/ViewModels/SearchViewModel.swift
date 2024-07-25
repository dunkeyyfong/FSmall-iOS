//
//  SearchViewModel.swift
//  FSmall-iOS
//
//  Created by dunkeyyfong on 25/07/2024.
//

import Foundation
import WebKit

class SearchViewModel {
    private let webView: WKWebView
    
    init(webView: WKWebView) {
        self.webView = webView
    }
    
    func performSeach(with query: String) {
        var formattedUrl = query.trimmingCharacters(in: .whitespacesAndNewlines)
        let hasDot = formattedUrl.contains(".")
        if hasDot {
            if !formattedUrl.hasPrefix("http://") && !formattedUrl.hasPrefix("https://") {
                formattedUrl = "http://" + formattedUrl
            }
            loadURL(formattedUrl)
        } else {
            let searchUrl = "https://www.google.com/search?q=\(formattedUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"
            loadURL(searchUrl)
        }
    }
    
    private func loadURL (_ urlString: String) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}
