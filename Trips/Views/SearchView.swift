import UIKit

final class SearchView: UIView {
    
    private let textLabel = UILabel()
    private let searchStackView = UIStackView()
    private let fromView = ChoiceView(.from)
    private let toView = ChoiceView(.to)
    private let personsView = ChoiceView(.persons)
    private let searchButton = SearchButton()
    
    init() {
        super.init(frame: .zero)
        prepareUI()
        prepareLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        prepareUI()
        prepareLayout()
    }
}

private extension SearchView {
    func prepareUI() {
        
        backgroundColor = .clear
        
        textLabel.text = "Choose the best tickets for your trip☺️"
        textLabel.textColor = .white
        textLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 16)
    }
    
    func prepareLayout() {
        [textLabel, searchStackView, searchButton].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [fromView, toView, personsView].forEach {
            searchStackView.addArrangedSubview($0)
        }
        searchStackView.axis  = .vertical
        searchStackView.distribution  = .fill
        searchStackView.alignment = .fill
        searchStackView.spacing = 16.0
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: topAnchor),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            searchStackView.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 10),
            searchStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            searchButton.topAnchor.constraint(equalTo: searchStackView.bottomAnchor, constant: 20),
            searchButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchButton.heightAnchor.constraint(equalToConstant: 40),
            searchButton.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
}
