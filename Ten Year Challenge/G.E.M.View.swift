import SwiftUI

struct G_E_M_View: View {
    @State private var number = 0

    var body: some View {
        VStack(alignment: .trailing) {
            GeometryReader { geometry in
                GEMView(number: self.number)
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
                        self.number += 1
                    }
                }
            }
        }
    }
}
struct PhotoView : View{
    var picNum : Int
    var name : String
    var body : some View{
        GeometryReader { geometry in
            VStack() {
                Image(name + "\(self.picNum)")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.width / 3 * 4)
                    .clipped()
                Text(String(self.picNum))
                    .fontWeight(.bold)
                    .font(.system(size: 30))
            }
        }
    }
}

struct GEMView : View{
    @State private var Autoplay : Bool = true
    
    var number : Int
    @State private var date = Date()
    @State private var year: Double = Double(Calendar.current.component(.year, from: Date()))
    
    var body: some View{
        
        var components = DateComponents()
        components.calendar = Calendar.current
        components.year = 2010
        let startDate = components.date!
        components.year = 2020
        let today = Date()
        
        return VStack(alignment: .leading) {
            PhotoView(picNum: Autoplay ? (number % 11)  + 2010 : Int(self.year), name: "G.E.M")
            Slider(value: Binding(get: {
                self.year
            }, set: {
                self.year = $0
                var components = DateComponents()
                components.calendar = Calendar.current
                components.year = Int(self.year)
                self.date = components.date!
            }), in: 2010...2020, step: 1)
            DatePicker("年份", selection: Binding(get: {
                self.date
            }, set: {
                self.date = $0
                self.year = Double(Calendar.current.component(.year, from: self.date))
            }), in: startDate...today, displayedComponents: .date)
            
            Toggle(isOn: $Autoplay) {
                Text("自動播放")
                    .font(.system(size: 25))
            }
            
        }
    }
}
struct G_E_M_View_Previews: PreviewProvider {
    static var previews: some View {
        G_E_M_View()
    }
}
