//
//  ProcessRunner.swift
//  LaunchCmd
//
//  Created by Roberto Machorro on 8/21/22.
//

import Foundation

func runProcess(input: String) throws -> String {
	var parts = input.split(separator: " ")

	if parts.count > 1 {
		let executable = String(parts.removeFirst())
		let parameters = parts.map { String($0) }

		return try runProcess(with: executable, and: parameters)
	}

	return ""
}

func runProcess(with executable: String, and arguments: [String]) throws -> String {
	// let task = NSTask() DEPRECATED

	let piped = Pipe()
	let process = Process()

	process.standardInput = nil
	process.standardOutput = piped
	process.standardError = piped
	process.arguments = arguments
	process.executableURL = URL(fileURLWithPath: executable)

	try process.run()

	let readData = piped.fileHandleForReading.readDataToEndOfFile()
	let output = String(data: readData, encoding: .utf8)!

	return output
}
