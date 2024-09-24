import SwiftUI
import Observation

@Observable
class BaseNavigation {
    var path = [String]()
}

struct ContentView: View {
    @State var baseNavigation = BaseNavigation()
    var body: some View {
        NavigationStack(path: $baseNavigation.path) {
            VStack {
                Button("Show FirstView") {
                    baseNavigation.path = ["FirstView"]
                }
            }
            .navigationDestination(for: String.self) { selection in
                switch selection {
                case "FirstView":
                    FirstView()
                case "SecondView":
                    SecondView()
                default:
                    EmptyView()
                }
            }
        }
        .environment(baseNavigation)
    }
}

struct FirstView: View {
    @Environment(BaseNavigation.self) var baseNavigation
    
    var body: some View {
        Button("Show SecondView") {
            baseNavigation.path.append("SecondView")
        }
    }
}

struct SecondView: View {
    var body: some View {
        Color.yellow
    }
}

struct EmptyView: View {
    var body: some View {
        Color.blue
    }
}

#Preview {
    ContentView()
}
