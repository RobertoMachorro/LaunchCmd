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
					output = input
				}
			}
			Spacer()
			Text(output)
			Spacer()
		}
		.frame(minWidth: 400, minHeight: 400)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
