import SwiftUI

struct SplashScreen: View {
    // State variable to control the view transition
    @State private var isActive = false
    @State private var rotateLogo = false // State for rotating the logo

    var body: some View {
        if isActive {
            Login_Screen() // Redirect to Login_Screen
        } else {
            ZStack {
                // Gradient background with custom colors
                LinearGradient(gradient: Gradient(colors: [Color(hex: "#FF4800"), Color(hex: "#F3936D"), Color(hex: "#E75B24")]),
                               startPoint: .top,
                               endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                // TasteBook logo with rotation animation
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .rotationEffect(.degrees(rotateLogo ? 360 : 0)) // Rotate logo
                    .animation(.easeInOut(duration: 0.5), value: rotateLogo) // Animate over 1 second
            }
            .onAppear {
                // Start logo rotation when view appears
                rotateLogo = true

                // Wait for 3 seconds before redirecting
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}

// Extension to convert hex to Color
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hex)
        if hex.hasPrefix("#") {
            scanner.currentIndex = scanner.string.index(after: scanner.currentIndex)
        }
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
