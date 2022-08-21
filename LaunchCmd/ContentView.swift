//
//  ContentView.swift
//  LaunchCmd
//
//  Created by Roberto Machorro on 8/21/22.
//

import SwiftUI

struct ContentView: View {
	@State private var input: String = ""
	@State private var output: String = ""
	
	var body: some View {
		VStack {
			HStack {
				TextField(text: $input) {
					Text("Command")
				}
				Button("Run") {
					do {
						output = try runProcess(with: "/bin/zsh", and: ["-c", input])
					}
					catch {
						output = error.localizedDescription
					}
				}
			}
			Spacer()
			Text(output)
			Spacer()
		}
		.frame(minWidth: 500, minHeight: 350)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
