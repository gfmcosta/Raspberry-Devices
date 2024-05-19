import SwiftUI

struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @State private var isLoginSuccessful = false

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Image("iot") // Certifique-se de ter uma imagem chamada "logo" no seu asset catalog
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .padding(.bottom, 40)
                
                VStack(spacing: 20) {
                    TextField("Username", text: $email)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)

                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10)
                }
                .padding(.horizontal, 40)
                
                Button(action: {
                    if validateCredentials(email: email, password: password) {
                        alertMessage = "Bem-vindo, \(email)!"
                        isLoginSuccessful = true
                    } else {
                        alertMessage = "Username ou password incorretos"
                        showingAlert = true
                    }
                }) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 50)
                        .background(Color(red: 59/255, green: 172/255, blue: 182/255))
                        .cornerRadius(10)
                        .padding(.top, 20)
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Raspberry Devices"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
                
                Spacer()
            }
            .background(Color(.systemGroupedBackground))
            .edgesIgnoringSafeArea(.all)
            .navigationDestination(isPresented: $isLoginSuccessful) {
                MenuView()
            }
        }
    }

    func validateCredentials(email: String, password: String) -> Bool {
        return email == "costa" && password == "joao"
    }
}

#Preview {
    ContentView()
}
