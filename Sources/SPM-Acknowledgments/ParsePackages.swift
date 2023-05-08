//
//  ParsePackages.swift
//  FlightTrack
//
//  Created by Tim Roesner on 2/19/20.
//  Copyright © 2020 Tim Roesner. All rights reserved.
//

import Foundation

open struct Package: Codable {
	let name: String
	let licenseURL: URL
	var license: String = ""
	
	private enum CodingKeys: String, CodingKey{
		case name = "package"
		case licenseURL = "repositoryURL"
	}
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decode(String.self, forKey: .name)
		let baseURL = try values.decode(URL.self, forKey: .licenseURL)
		licenseURL = baseURL.appendingPathComponent("/raw/master/LICENSE")
	}
}

open class ParsePackages {
	private struct Object: Codable {
		var object: Pins
	}
	
	private struct Pins: Codable {
		var pins: [Package]
	}
	
	func parsePackages() -> [Package] {
		guard let packagesPath = Bundle.main.path(forResource: "Package", ofType: "resolved"),
			let data = try? Data(contentsOf: URL(fileURLWithPath: packagesPath)) ,
			let json = try? JSONDecoder().decode(Object.self, from: data) else { return [] }
        return json.object.pins.filter({ $0.name != "SPM-Acknowledgments" && !$0.licenseURL.absoluteString.contains(".git/") })
	}
}
