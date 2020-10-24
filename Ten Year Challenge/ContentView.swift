import SwiftUI

struct ContentView: View {
    var body: some View {
//        TabView {
            G_E_M_View()
                .tabItem {
                    Image(systemName: "heart.circle.fill")
                    Text("G.E.M")
                }
//            G_E_M_View()
//                .tabItem {
//                    Image(systemName: "globe")
//                    Text("Internet")
//                }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
