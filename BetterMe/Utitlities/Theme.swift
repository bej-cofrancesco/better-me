//
//  Theme.swift
//  BetterMe
//
//  Created by Benjamin Cofrancesco on 7/1/2026.
//

import SwiftUI

struct Theme {
    
    // MARK: - Background Colors
    
    /// Dark blue-gray background (main app background)
    static let darkBackground = Color(hex: "2C3E50")
    
    /// Near black background for deeper UI elements
    static let nearBlack = Color(hex: "1A1A1A")
    
    /// Alternative dark background
    static let darkBackgroundAlt = Color(hex: "212121")
    
    // MARK: - Accent Colors (Metric Rings)
    
    /// Light blue/slate blue for Sleep metric ring
    static let sleepBlue = Color(hex: "6B8CAE")
    
    /// Bright green for Recovery metric ring (signature WHOOP green)
    static let recoveryGreen = Color(hex: "3EFF3E")
    
    /// Alternative recovery green
    static let recoveryGreenAlt = Color(hex: "39FF14")
    
    /// Cyan blue for Strain metric ring and activity indicators
    static let strainCyan = Color(hex: "00B8E6")
    
    /// Alternative cyan blue
    static let strainCyanAlt = Color(hex: "1E9FD8")
    
    // MARK: - Text Colors
    
    /// Primary white text
    static let textPrimary = Color.white
    
    /// Secondary medium gray text
    static let textSecondary = Color(hex: "4A5568")
    
    /// Light gray text for borders and dividers
    static let textTertiary = Color(hex: "718096")
    
    // MARK: - UI Element Colors
    
    /// Medium gray for secondary text and inactive elements
    static let uiMediumGray = Color(hex: "4A5568")
    
    /// Light gray for borders and dividers
    static let uiLightGray = Color(hex: "718096")
    
    // MARK: - Activity Colors
    
    /// Blue shade for running activities
    static let activityRunning = Color(hex: "1E9FD8")
    
    /// Blue shade for cycling activities
    static let activityCycling = Color(hex: "00B8E6")
    
    /// Blue shade for mountain biking activities
    static let activityMountainBiking = Color(hex: "1E9FD8")
    
    // MARK: - Semantic Colors
    
    /// Orange accent for warnings or highlights
    static let accentOrange = Color(hex: "FF6B35")
    
    /// Blue accent for primary actions
    static let accentBlue = Color(hex: "1E9FD8")
    
    // MARK: - Convenience Properties
    
    /// Primary background color
    static var background: Color {
        darkBackground
    }
    
    /// Primary text color
    static var text: Color {
        textPrimary
    }
    
    /// Secondary text color (convenience property)
    static var secondaryText: Color {
        uiMediumGray
    }
}

// MARK: - Color Extension

extension Color {

    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// MARK: - View Modifier for Easy Theming

struct ThemedBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Theme.background)
    }
}

extension View {
    func themedBackground() -> some View {
        modifier(ThemedBackground())
    }
}

