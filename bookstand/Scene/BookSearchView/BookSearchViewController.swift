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

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
    }
}

// MARK: - layout

extension BookSearchViewController {

    func configureLayout() {

        view.backgroundColor = .systemBackground

        configureHeaderLayout()
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
