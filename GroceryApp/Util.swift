//
//  Util.swift
//  GroceryApp
//
//  Created by Yash Shah on 11/16/24.
//

import Foundation
import SwiftUI

public func getDataAsString(pathName: String) -> String {
    let fileURL = URL(fileURLWithPath: pathName)
    
    do {
        return try String(contentsOf: fileURL, encoding: .utf8)
    } catch {
        return "Error reading file: \(error.localizedDescription)"
    }
}


private func getProductIDsString() -> String {
    let viewModel = ViewModel()
    var productIDsString: String = ""
    let products = viewModel.products
    
    for product in products {
        productIDsString += "\(product.id), "
    }
    
    return productIDsString
}

public func generateAnalysisPrompt() -> String {
    // prompt contains entire csv and user shopping cart products
    return "(Talk in 1st person) Provide a brief analysis report on what stores the user should be going to based on prices of the products in their cart with IDs: \(getProductIDsString()) Only provide analysis which should be 2-3 sentences, no other details \(getDataAsString(pathName: "/Users/yashshah/Desktop/GroceryApp/GroceryApp/Back End/SampleData.csv"))"
}

extension String {
    public func formatDayAndMonthStrings() -> String {
        return String(self.prefix(3))
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r, g, b: Double
        r = Double((int >> 16) & 0xFF) / 255.0
        g = Double((int >> 8) & 0xFF) / 255.0
        b = Double(int & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}
