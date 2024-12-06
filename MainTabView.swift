import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ExplorePage()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Explore")
                }

            SavedPage()
                .tabItem {
                    Image(systemName: "bookmark")
                    Text("Saved")
                }

            AppointmentsPage()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Appointments")
                }

            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
        .accentColor(.blue)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
