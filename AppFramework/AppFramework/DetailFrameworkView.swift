import SwiftUI

struct DetailFrameworkView: View {
    
    let framework: Framework
    
    @Binding var isShowingDetailView: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button {
                    isShowingDetailView = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color(.label))
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                }
            }
            .padding()
            
            Spacer()
            
            FrameworkTitleView(framework: framework)
            
            Text(framework.description)
                .padding(.all, 20)
                .font(.body)
            
            Spacer()
            
            Button {
                
            } label: {
                Text("More detail")
                    .padding()
                    .foregroundColor(.white)
                    .font(.title3)
                    .frame(width: 280, height: 58)
                    .background(.red)
                    .cornerRadius(10.0)
            }
        }
    }
}

#Preview {
    DetailFrameworkView(framework: MockData.sampleFramework, isShowingDetailView: .constant(false))
        
}
