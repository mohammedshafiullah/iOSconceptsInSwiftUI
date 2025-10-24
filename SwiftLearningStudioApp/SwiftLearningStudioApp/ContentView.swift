//
//  ContentView.swift
//  SwiftLearningStudioApp
//
//  Created by mohammed Shafiullah on 22/10/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
     
        TabView{
            LanguageFundamentalsView ()
                .tabItem {
                    Label("Language Fundamentals", systemImage: "book")
                }
//            ConcurrencyView()
//                .tabItem {
//                    Label("Concurrency", systemImage: "bolt")
//                }
//            NetworkingView()
//                .tabItem {
//                    Label("Networking", systemImage: "network")
//                }
//            StorageView()
//                .tabitem {
//                    Label("Storage", systemImage: "folder")
//                }
//            SwiftUIViewTopics()
//                .tabItem {
//                    Label("SwiftUI View Topics", systemImage: "pencil")
//                }
//            CombineView(){
//                .tabItem {
//                    Label("Combine", systemImage: "arrow.2.circlepath.circle")
//                }
//            }
//            TestingView(){
//                .tabItem {
//                    Label("Testing", systemImage: "pencil.and.outline")
//                }
//            }
            
        }
    }



  
}



#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
