import SwiftUI

struct Login_Screen: View {
    var body: some View {
        VStack {
            Spacer()
            
            Image("logo")
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
                .foregroundColor(.orange)
            
            VStack(spacing: 10) {
                SignInBtn(text: "Continue with Apple", image: "applelogo")
                SignInBtn(text: "Continue with Google", image: "googleicon")
                SignInBtn(text: "Continue with Facebook", image: "fbicon")
                SignInBtn(text: "Continue with E-mail", image: "emaillogo")
            }
            .padding()
            
            Button("I'll do it later") {
                // Handle later action
            }
            .foregroundColor(.blue)
            .padding(.top)
            
            Spacer()
            
            Image("bottombar")
                .resizable()
                .frame(width: .infinity, height: 100)
            
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct SignInBtn: View {
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

struct Login_Screen_Previews: PreviewProvider {
    static var previews: some View {
        Login_Screen()
    }
}
