import UIKit
import WebKit

class BrowserViewController: UIViewController, UITextFieldDelegate {
    
    private var searchTextField: UITextField!
    private var webView: WKWebView!
    private var viewModel: SearchViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUIBrowser()
        viewModel = SearchViewModel(webView: webView)
        viewModel.performSeach(with: "")
    }
    
    private func setupUIBrowser() {
        view.backgroundColor = .systemBackground
        
        searchTextField = UITextField()
        searchTextField.borderStyle = .roundedRect
        searchTextField.placeholder = "Search"
        searchTextField.delegate = self
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchTextField)
        
        webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(webView)
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            searchTextField.heightAnchor.constraint(equalToConstant: 40),
            
            webView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 10),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let searchText = textField.text {
            viewModel.performSeach(with: searchText)
        }
        textField.resignFirstResponder()
        return true
    }
}
