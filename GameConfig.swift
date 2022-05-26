import SwiftUI

class GameConfig: ObservableObject {
    @Published var particleBirthRate: Double = 60
    @Published var particleTexture: Texture = .🤍
    
    // Particle scale
    @Published var particleScale: Double = 0.2
    @Published var particleScaleRange: Double = 0.1
    
    // Particle color and alpha
    @Published var particleAlphaSpeed: Double = 0
    @Published var particleColor: Color = .pink
    @Published var particleColorBlendFactor: Double = 0.5
    @Published var particleColorBlueRange: Double = 0.4
    @Published var particleColorGreenRange: Double = 0.4
    @Published var particleColorRedRange: Double = 0.4
    
    // Particle velocity and acceleration
    @Published var particleSpeed: Double = 60
    @Published var particleSpeedRange: Double = 45
    @Published var emissionAngle: Double = 90
    @Published var emissionAngleRange: Double = 45
    @Published var xAcceleration: Double = 0
    @Published var yAcceleration: Double = -20

    // Particle rotation
    @Published var particleRotation: Double = 0
    @Published var particleRotationRange: Double = 0
    @Published var particleRotationSpeed: Double = 45
    
    enum Texture: String, Pickable {
        case 🤍,🟡,🔲,🔺,🔶
    }
}
