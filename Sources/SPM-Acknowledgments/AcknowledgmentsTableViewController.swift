//
//  AcknowledgmentsTableViewController.swift
//  FlightTrack
//
//  Created by Tim Roesner on 2/20/20.
//  Copyright © 2020 Tim Roesner. All rights reserved.
//

import UIKit

/// The TableViewController that displays all SPM packages in a list. Tapping on the name of a package will
/// present the license, which is being downloaded from GitHub.
///
/// - Note: Should be presented within a `UINavigationController` to display titles in a Navigation Bar.
final public class AcknowledgmentsTableViewController: UITableViewController {
	private var packages = [Package]()
	private let cellIdentifier = "cell"
	
	override public func viewDidLoad() {
		super.viewDidLoad()
		title = NSLocalizedString("Acknowledgments", comment: "")
		packages = ParsePackages().parsePackages()
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
		tableView.tableFooterView = footerView
	}
	
	override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return packages.count
	}
	
	override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
		cell.textLabel?.text = packages[indexPath.row].name
		cell.accessoryType = .disclosureIndicator
		return cell
	}
	
	override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		let textViewController = AcknowledgmentsTextViewController(package: packages[indexPath.row])
		if let navController = navigationController {
			navController.pushViewController(textViewController, animated: true)
		} else {
			present(textViewController, animated: true, completion: nil)
		}
	}
	
	private let footerView: UITextView = {
		let textView = UITextView()
		textView.dataDetectorTypes = .link
		textView.isEditable = false
		textView.backgroundColor = .clear
		textView.textAlignment = .center
		textView.font = UIFont.preferredFont(forTextStyle: .footnote)
		if #available(iOS 13.0, *) {
			textView.textColor = .secondaryLabel
		} else {
			textView.textColor = .lightGray
		}
		textView.text = NSLocalizedString("Generated with SPM Acknowledgments\nhttps://github.com/timroesner/SPM-Acknowledgments", comment: "")
		textView.sizeToFit()
		return textView
	}()
}
