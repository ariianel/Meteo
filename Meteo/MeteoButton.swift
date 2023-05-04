//
//  MeteoButton.swift
//  Meteo
//
//  Created by Ariane Luc on 05/05/2023.
//

import SwiftUI

struct MeteoButtonView: View {
    
    var title : String
    var textColor : Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height:50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
