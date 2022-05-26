import SpriteKit
import struct SwiftUI.Angle

class GameScene: SKScene {
    let emitter: SKEmitterNode = {
        let textureNode = SKLabelNode(text: "🤍")
        textureNode.fontSize = 18.0
        let texture = SKView().texture(from: textureNode)
        
        let emitter = SKEmitterNode()
        emitter.particleLifetime = 8.0
        emitter.particlePosition = .zero
        return emitter
    }()
    var texture = ""
    var config: GameConfig?
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented")
    }
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        emitter.position = CGPoint(x: frame.midX, y: frame.midY)
        if emitter.parent == nil {
            addChild(emitter)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        updateFromConfig()
    }
    
    func updateFromConfig() {
        guard let config = config else { return }
        
        if emitter.particleScale != config.particleScale {
            emitter.particleScale = config.particleScale
        }
        
        if emitter.particleScaleRange != config.particleScaleRange {
            emitter.particleScaleRange = config.particleScaleRange
        }
        
        if emitter.particleBirthRate != config.particleBirthRate {
            emitter.particleBirthRate = config.particleBirthRate
        }
        
        if emitter.particleAlphaSpeed != config.particleAlphaSpeed {
            emitter.particleAlphaSpeed = config.particleAlphaSpeed
        }
        
        if emitter.particleColor != UIColor(config.particleColor) {
            emitter.particleColor = UIColor(config.particleColor)
        }
        if emitter.particleColorBlendFactor != config.particleColorBlendFactor {
            emitter.particleColorBlendFactor = config.particleColorBlendFactor
        }
        if emitter.particleColorBlueRange != config.particleColorBlueRange {
            emitter.particleColorBlueRange = config.particleColorBlueRange
        }
        if emitter.particleColorGreenRange != config.particleColorGreenRange {
            emitter.particleColorGreenRange = config.particleColorGreenRange
        }
        if emitter.particleColorRedRange != config.particleColorRedRange {
            emitter.particleColorRedRange = config.particleColorRedRange
        }
        
        if texture != config.particleTexture.rawValue {
            texture = config.particleTexture.rawValue
            emitter.particleTexture = SKView().texture(from: SKLabelNode(text: texture))
        }
        
        if emitter.particleSpeed != config.particleSpeed {
            emitter.particleSpeed = config.particleSpeed
        }
        
        if emitter.particleSpeedRange != config.particleSpeedRange {
            emitter.particleSpeedRange = config.particleSpeedRange
        }
        
        if emitter.emissionAngle != Angle(degrees: config.emissionAngle).radians {
            emitter.emissionAngle = Angle(degrees: config.emissionAngle).radians
        }
        
        if emitter.emissionAngleRange != Angle(degrees: config.emissionAngleRange).radians {
            emitter.emissionAngleRange = Angle(degrees: config.emissionAngleRange).radians
        }
        
        if emitter.xAcceleration != config.xAcceleration {
            emitter.xAcceleration = config.xAcceleration
        }
        
        if emitter.yAcceleration != config.yAcceleration {
            emitter.yAcceleration = config.yAcceleration
        }
        
        if emitter.particleRotation != Angle(degrees: config.particleRotation).radians {
            emitter.particleRotation = Angle(degrees: config.particleRotation).radians
        }
        
        if emitter.particleRotationRange != Angle(degrees: config.particleRotationRange).radians {
            emitter.particleRotationRange = Angle(degrees: config.particleRotationRange).radians
        }
        
        if emitter.particleRotationSpeed != Angle(degrees: config.particleRotationSpeed).radians {
            emitter.particleRotationSpeed = Angle(degrees: config.particleRotationSpeed).radians
        }
    }
}
