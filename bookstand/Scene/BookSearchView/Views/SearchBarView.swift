//
//  SearchBarView.swift
//  bookstand
//
//  Created by sh.hong on 2021/08/30.
//

import UIKit

public final class SearchBarView: UIView {

    private let contanierView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .systemGray5
        $0.layer.cornerRadius = 8
        return $0
    }(UIView())

    private let searchImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(systemName: "magnifyingglass")
        $0.contentMode = .scaleAspectFit
        $0.tintColor = .systemGray
        $0.setContentHuggingPriority(.required, for: .horizontal)
        return $0
    }(UIImageView())

    private let textField: UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.attributedPlaceholder = NSAttributedString(
            string: "Search ...",
            attributes: [
            .font: UIFont.preferredFont(forTextStyle: UIFont.TextStyle.subheadline)
            ]
        )
        $0.clearButtonMode = .always
        return $0
    }(UITextField())

    private let cancelButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        $0.setTitle("Cancel", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.isHidden = true
        return $0
    }(UIButton())

    public var textDidChange: ((_ text: String) -> Void)?

    public override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()

        textField.addTarget(self, action: #selector(changeText(_ :)), for: .editingChanged)
        textField.addTarget(self, action: #selector(startEditing), for: .editingDidBegin)

        cancelButton.addTarget(self, action: #selector(tapCancelButton), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureLayout() {

        let stackView = UIStackView(arrangedSubviews: [contanierView, cancelButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 5

        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -5)
        ])

        contanierView.addSubview(searchImageView)
        NSLayoutConstraint.activate([
            searchImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            searchImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])

        contanierView.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.leftAnchor.constraint(equalTo: searchImageView.rightAnchor, constant: 5),
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor),
            textField.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }

    @objc
    private func changeText(_ textField: UITextField) {
        guard let text = textField.text else { return }
        textDidChange?(text)
    }

    @objc
    private func startEditing() {
        changeCancelButton(hidden: false)
    }

    @objc
    private func tapCancelButton() {
        changeCancelButton(hidden: true)
        textField.endEditing(true)
    }

    private func changeCancelButton(hidden: Bool) {
        cancelButton.isHidden = hidden
        UIView.animate(
            withDuration: 0.3,
            delay: .zero,
            options: [.curveEaseInOut],
            animations: { [weak self] in self?.layoutIfNeeded()
        })
    }
}

#if DEBUG
import SwiftUI

struct SearchBarViewRepresentable: UIViewRepresentable {
    typealias UIViewType = SearchBarView

    func makeUIView(context: Context) -> SearchBarView {
        SearchBarView()
    }

    func updateUIView(_ uiView: SearchBarView, context: Context) {

    }
}

struct SearchBarViewRepresentable_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarViewRepresentable()
            .frame(height: 40)
            .previewLayout(.sizeThatFits)

        SearchBarViewRepresentable()
            .frame(height: 40)
            .previewLayout(.sizeThatFits)
            .colorScheme(.dark)
    }
}

#endif
