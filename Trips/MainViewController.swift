import UIKit

final class MainViewController: UIViewController {
    
    private let mainHeaderView = MainHeaderView()
    private let searchView = SearchView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
        prepareLayout()
    }
}

private extension MainViewController {
    func prepareUI() {
        view.backgroundColor = UIColor(named: "Blue")
        
        view.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(dismissKeyboard)
            )
        )
    }
    
    func prepareLayout() {
        [mainHeaderView, searchView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            mainHeaderView.topAnchor.constraint(equalTo: view.topAnchor),
            mainHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            searchView.topAnchor.constraint(equalTo: mainHeaderView.bottomAnchor, constant: 20),
            searchView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            searchView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
        ])
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

