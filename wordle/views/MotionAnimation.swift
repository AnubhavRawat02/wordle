//used in wordle fever 
import SwiftUI

struct MotionAnimation: View {
    
    @State private var isAnimating:Bool = false
    
    func randomSize() -> CGFloat{
        return CGFloat(Int.random(in: 10...300))
    }
    
    func randomCoordinate(max: CGFloat) -> CGFloat{
        return CGFloat.random(in: 0...max)
    }
    
    func randomSpeed() -> CGFloat{
        return CGFloat.random(in: 0.025...0.05)
    }
    
    func randomDelay() -> Double{
        return Double.random(in: 0...2)
    }
    
    func randomScale() -> CGFloat{
        return CGFloat.random(in: 1.0...2.0)
    }
    
    var body: some View {
        GeometryReader{geometry in
            ZStack{
                Color("skyBlue").ignoresSafeArea()
                ForEach(0...12, id:\.self){item in
                    Circle()
                        .fill(.gray.opacity(0.10))
                        .frame(width: randomSize(), height: randomSize())
                        .scaleEffect(isAnimating ? randomScale(): 1)
                        .position(x: randomCoordinate(max: geometry.size.width), y: randomCoordinate(max: geometry.size.height))
                        .animation(Animation.interactiveSpring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.2)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        )
                        
                }
            }.onAppear {
                isAnimating = true
            }
//            .drawingGroup()
        }
    }
}

struct MotionAnimation_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimation()
    }
}

//t
