//
//  AppView.swift
//  HW4
//
//

import SwiftUI

struct AppView: View {
    @ObservedObject var charactersData = CharactersData()
    var body: some View {
        TabView{
            CharacterList(charactersData: self.charactersData)
                .tabItem{
                    Image(systemName: "person.circle")
                    Text("角色列表")
            }
            ChartView(charactersData: self.charactersData)
                .tabItem{
                    Image(systemName: "chart.pie")
                    Text("統計圖表")
            }
        }
        .accentColor(.orange)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
