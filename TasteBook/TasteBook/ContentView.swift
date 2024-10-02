import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            
            Image("TasteBookLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text("Welcome To TasteBook !")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("TasteBook is an ultimate food recepies app that\nyou can find best cooking recepies with full\ndetails or your can share your cooking ideas with\ncommunity")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding()
            
            Text("Sign in or Create a Account")
                .font(.headline)
                .padding(.top)
            
            VStack(spacing: 10) {
                SignInButton(text: "Continue with Apple", image: "apple.logo")
                SignInButton(text: "Continue with Google", image: "g.circle.fill")
                SignInButton(text: "Continue with Facebook", image: "facebook")
                SignInButton(text: "Continue with E-mail", image: "envelope.fill")
            }
            .padding()
            
            Button("I'll do it later") {
                // Handle later action
            }
            .foregroundColor(.blue)
            .padding(.top)
            
            Spacer()
            
            Rectangle()
                .fill(Color.orange)
                .frame(height: 50)
                .overlay(
                    Rectangle()
                        .fill(Color.white)
                        .frame(height: 50)
                        .rotationEffect(.degrees(5), anchor: .bottomLeading)
                )
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct SignInButton: View {
    let text: String
    let image: String
    
    var body: some View {
        Button(action: {
            // Handle sign in action
        }) {
            HStack {
                Image(systemName: image)
                    .foregroundColor(.black)
                Text(text)
                    .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
