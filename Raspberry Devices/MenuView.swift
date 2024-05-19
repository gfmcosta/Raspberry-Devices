import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            Text("Bem-vindo!")
                .font(.largeTitle)
                .padding()
            Text("Você fez login com sucesso.")
                .font(.headline)
        }
    }
}

#Preview{
    MenuView()
}
