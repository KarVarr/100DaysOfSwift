//
//  ProspectsView.swift
//  SwiftUIHotProspects
//
//  Created by Karen Vardanian on 02.04.2023.
//
import CodeScanner
import SwiftUI
import UserNotifications

struct ProspectsView: View {
    enum FilterType {
        case none, contacted, uncontacted
    }
    
    enum Sorted {
        case name, recent
    }
    
    let listOfPeople = PeopleNameAndEmails()
    
    @EnvironmentObject var prospects: Prospects
    let filter: FilterType
    
    @State private var isShowingScanner = false
    @State private var isShowingFilterDialog = false
    
    @State var sort: Sorted = .name
    
    var body: some View {
        NavigationView {
            List {
                ForEach(sortedProspects) { prospect in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(prospect.name)
                                .font(.headline)
                            Text(prospect.emailAddress)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        //Challenge 1
                        if prospect.isContacted {
                            Image(systemName: "person.fill.checkmark")
                                .foregroundColor(.mint)
                                .font(.system(size: 24))
                                
                        } else {
                            Image(systemName: "person.fill.questionmark")
                                .foregroundColor(.orange)
                                .font(.system(size: 24))
                        }
                    }
                    
                    .swipeActions {
                        if prospect.isContacted {
                            Button {
                                prospects.toggle(prospect)
                            } label: {
                                Label("Yes", systemImage: "person.crop.circle.badge.xmark")
                            }
                            .tint(.red)
                        } else {
                            Button {
                                prospects.toggle(prospect)
                            } label: {
                                Label("No", systemImage: "person.crop.circle.fill.badge.checkmark")
                            }
                            .tint(.green)
                            
                            Button {
                                addNotification(for: prospect)
                            } label: {
                                Label("Remind me", systemImage: "bell")
                            }
                            .tint(.indigo)
                        }
                    }
                    
                }
                .listRowSeparator(.hidden)
                .listRowBackground(LinearGradient(colors: [Color.pink.opacity(0.8), Color.blue.opacity(0.85)], startPoint: .bottomLeading, endPoint: .topTrailing))
            }
            .listStyle(.plain)
            .background(LinearGradient(colors: [Color.orange, Color.green, Color.yellow], startPoint: .topLeading, endPoint: .bottom))
            
            .navigationTitle(title)
            .toolbar {
                Button {
                   isShowingScanner = true
                } label: {
                    Label("Scan",systemImage: "qrcode.viewfinder")
                }
                
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isShowingFilterDialog = true
                    } label: {
                        Label("Filter", systemImage: "list.number")
                    }
                    //Challenge 3
                    .confirmationDialog("Filter list", isPresented: $isShowingFilterDialog, titleVisibility: .visible) {
                        Button {
                            withAnimation {
                                sort = .name
                            }
                        } label: {
                            Text("Sorter by name")
                        }
                        Button {
                            withAnimation {
                                sort = .recent
                            }
                        } label: {
                            Text("Most recent")
                        }
                       
                    }
                }
            }
            .sheet(isPresented: $isShowingScanner) {
                CodeScannerView(codeTypes: [.qr], simulatedData: listOfPeople.arrayOfList.randomElement() ?? "Paul Hudson\npaul@hackingwithswift.com", completion: handleScan)
            }
        }
    }
    
    
    
    var title: String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted people"
        case .uncontacted:
            return "Uncontacted people"
        }
    }
    
    var filteredProspects: [Prospect] {
        switch filter {
        case .none:
            return prospects.people
        case .contacted:
            return prospects.people.filter {$0.isContacted}
        case .uncontacted:
            return prospects.people.filter{!$0.isContacted}
        }
    }
    
    var sortedProspects: [Prospect] {
        switch sort {
        case .name:
            return filteredProspects.sorted{ $0.name < $1.name}
        case.recent:
            return filteredProspects.sorted{ $0.date > $1.date}
        }
    }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
        isShowingScanner = false
        
        switch result {
        case .success(let result):
            let details = result.string.components(separatedBy: "\n")
            guard details.count == 2 else { return }
            
            let person = Prospect()
            person.name = details[0]
            person.emailAddress = details[1]
            
            prospects.add(person)
            
        case .failure(let error):
            print("Scanning failed: \(error.localizedDescription)")
        }
    }
    
    func addNotification(for prospect: Prospect) {
        let center = UNUserNotificationCenter.current()
        
        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "Contact \(prospect.name)"
            content.subtitle = prospect.emailAddress
            content.sound = UNNotificationSound.default
            
            var dateComponents = DateComponents()
            dateComponents.hour = 9
            //let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            
            center.add(request)
        }
        
        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                addRequest()
            } else {
                center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        addRequest()
                    } else {
                        print("D'oh")
                    }
                }
            }
        }
    }
    
}

struct ProspectsVIew_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
            .environmentObject(Prospects())
    }
}
