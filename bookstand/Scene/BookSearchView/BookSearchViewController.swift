//
//  BookSearchViewController.swift
//  bookstand
//
//  Created by sh.hong on 2021/08/23.
//

import UIKit

class BookSearchViewController: UIViewController {

    private let headerView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())

    private let searchBarView: SearchBarView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(SearchBarView())

    private let pickerView: UISegmentedControl = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.selectedSegmentIndex = .zero
        return $0
    }(UISegmentedControl())

    private let tags: [String] = ["제목", "ISBN", "출판사", "인명"]
    private var tagIndex: Int = .zero {
        didSet { print("tagIndex: \(tagIndex)") }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
    }

    @objc
    private func pickSegmented(_ segmented: UISegmentedControl) {
        tagIndex = segmented.selectedSegmentIndex
    }
}

// MARK: - layout

extension BookSearchViewController {

    func configureLayout() {

        view.backgroundColor = .systemBackground

        configureHeaderLayout()
        configurePickerView()
    }

    func configureHeaderLayout() {

        view.addSubview(headerView)
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            headerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 44)
        ])

        headerView.addSubview(searchBarView)
        NSLayoutConstraint.activate([
            searchBarView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 5),
            searchBarView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -5),
            searchBarView.rightAnchor.constraint(equalTo: headerView.rightAnchor, constant: -10),
            searchBarView.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 10)
        ])
    }

    func configurePickerView() {

        tags.enumerated().forEach { index, tag in
            pickerView.insertSegment(withTitle: tag, at: index, animated: false)
        }

        pickerView.selectedSegmentIndex = tagIndex
        pickerView.addTarget(self, action: #selector(pickSegmented(_:)), for: .valueChanged)

        view.addSubview(pickerView)
        NSLayoutConstraint.activate([
            pickerView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 30),
            pickerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            pickerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15)
        ])
    }
}

#if DEBUG
import SwiftUI

struct BookSearchViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = BookSearchViewController

    func updateUIViewController(_ uiViewController: BookSearchViewController, context: Context) {

    }

    func makeUIViewController(context: Context) -> BookSearchViewController {
        BookSearchViewController()
    }
}

struct BookSearchViewControllerRepresentable_Previews: PreviewProvider {
    static var previews: some View {
        BookSearchViewControllerRepresentable()

        BookSearchViewControllerRepresentable()
            .colorScheme(.dark)
    }
}
#endif
