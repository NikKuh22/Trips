import UIKit

final class ChoiceView: UIView {
    
    private let searchTextField = UITextField()
    private let choiceLocationImageView = UIImageView()
    
    init(_ type: ChoiceViewType) {
        super.init(frame: .zero)
        prepareUI(type)
        prepareLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        prepareUI(.to)
        prepareLayout()
    }
}

private extension ChoiceView {
    func prepareUI(_ type: ChoiceViewType) {
        layer.cornerRadius = 10
        backgroundColor = .white
        
        searchTextField.keyboardType = type.keyboardType
        searchTextField.textColor = .black
        searchTextField.font = UIFont(name: "Arial Rounded MT Bold", size: 16)
        searchTextField.attributedPlaceholder = .init(
            string: type.placeholderText,
            attributes: [
                .foregroundColor: UIColor.lightGray,
                .font: UIFont(name: "Arial Rounded MT Bold", size: 16)!
            ]
        )
        
        choiceLocationImageView.image = type.image
        choiceLocationImageView.tintColor = UIColor(named: "Pink")
    }
    
    func prepareLayout() {
        [choiceLocationImageView, searchTextField].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 40),
            
            choiceLocationImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            choiceLocationImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            choiceLocationImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            choiceLocationImageView.widthAnchor.constraint(equalTo: choiceLocationImageView.heightAnchor),
            
            searchTextField.leadingAnchor.constraint(equalTo: choiceLocationImageView.trailingAnchor, constant: 10),
            searchTextField.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            searchTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            searchTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }
}

extension ChoiceView {
    enum ChoiceViewType {
        case from
        case to
        case persons
        
        var textField: UITextField {
            switch self {
            case .from, .to, .persons:
                return .init(frame: .zero)
            }
        }
        
        var image: UIImage? {
            switch self {
            case .from:
                return .init(systemName: "airplane.departure")
            case .to:
                return .init(systemName: "airplane.arrival")
            case .persons:
                return .init(systemName: "person.fill")
            }
        }
        
        var placeholderText: String {
            switch self {
            case .from:
                return "From"
            case .to:
                return "To"
            case .persons:
                return "Persons"
            }
        }
        
        var keyboardType: UIKeyboardType {
            switch self {
            case .from, .to:
                return .default
            case .persons:
                return .numberPad
            }
        }
    }
}
