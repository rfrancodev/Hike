//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Rafael Franco on 24/09/24.
//

import Foundation
import SwiftUI

struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                // Conditional statement with nil coalescing
                // Conditional ? A : B
                configuration.isPressed ?
                // A: when the user pressed the button
                LinearGradient(colors: [
                    .customGrayMedium,
                    .customGrayLight],
                               startPoint: .top,
                               endPoint: .bottom
                )
                :
                // B: when the Button is not pressed
                LinearGradient(colors: [
                    .customGrayLight,
                    .customGrayMedium],
                               startPoint: .top,
                               endPoint: .bottom
                )
            )
            .cornerRadius(40)
        
    }
}
