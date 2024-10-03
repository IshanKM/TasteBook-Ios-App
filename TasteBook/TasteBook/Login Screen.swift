import SwiftUI

struct Login_Screen: View {
    @State private var showHomepage = false

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
            
            Text("TasteBook is an ultimate food recipes app that\nyou can find best cooking recipes with full\ndetails or you can share your cooking ideas with\ncommunity")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding()
            
            Text("Sign in or Create an Account")
                .font(.headline)
                .padding(.top)
                .foregroundColor(.orange)
            
            VStack(spacing: 10) {
                SignInBtn(text: "Continue with Apple", image: "applelogo") {
                    continueWithApple()
                }
                SignInBtn(text: "Continue with Google", image: "googleicon") {
                    continueWithGoogle()
                }
                SignInBtn(text: "Continue with Facebook", image: "fbicon") {
                    continueWithFacebook()
                }
                SignInBtn(text: "Continue with E-mail", image: "emaillogo") {
                    continueWithEmail()
                }
            }
            .padding()
            
            Button("I'll do it later") {
                
            }
            .foregroundColor(.blue)
            .padding(.top)
            
            Spacer()
            
            Image("bottombar")
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .frame(width: .infinity, height: 100)
        }
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $showHomepage) {
            Homepage()
        }
    }
    
    private func continueWithApple() {
        print("Continuing with Apple...")
        showHomepage = true
    }
    
    private func continueWithGoogle() {
        print("Continuing with Google...")
        showHomepage = true
    }
    
    private func continueWithFacebook() {
        print("Continuing with Facebook...")
        showHomepage = true
    }
    
    private func continueWithEmail() {
        print("Continuing with Email...")
        showHomepage = true
    }
}


struct SignInBtn: View {
    let text: String
    let image: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
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
