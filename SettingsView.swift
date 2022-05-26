import SwiftUI

struct BoardingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(scene: GameScene(size: CGSize()))
            .environmentObject(GameConfig())
    }
}

struct SettingsView: View {
    let scene: GameScene
    @EnvironmentObject var gameConfig: GameConfig
    
    var body: some View {
        Form {
            Section {
                Button("Reset") { scene.emitter.resetSimulation() }
            }
            Section("Emitter") {
                SegmentedPicker(name: "Texture", value: $gameConfig.particleTexture, onChange: nil)
                SettingSlider(name: "Particle scale", value: $gameConfig.particleScale, range: 0.1...1)
                SettingSlider(name: "Particle scale range", value: $gameConfig.particleScaleRange, range: 0...2)
                SettingSlider(name: "Particle birth rate", value: $gameConfig.particleBirthRate, range: 1...500)
            }
            Section("Color & Alpha") {
                ColorPicker("Particle color", selection: $gameConfig.particleColor)
                SettingSlider(name: "Particle alpha speed", value: $gameConfig.particleAlphaSpeed, range: -1...1)
                SettingSlider(name: "Particle color blend factor", value: $gameConfig.particleColorBlendFactor, range: 0...1)
                SettingSlider(name: "Particle color blue range", value: $gameConfig.particleColorBlueRange, range: 0...1)
                SettingSlider(name: "Particle color green range", value: $gameConfig.particleColorGreenRange, range: 0...1)
                SettingSlider(name: "Particle color red range", value: $gameConfig.particleColorRedRange, range: 0...1)
            }
            Section("Velocity & Acceleration") {
                SettingSlider(name: "Particle speed", value: $gameConfig.particleSpeed, range: 0.1...300)
                SettingSlider(name: "Particle speed range", value: $gameConfig.particleSpeedRange, range: 1...500)
                SettingSlider(name: "Emission angle", value: $gameConfig.emissionAngle, range: 0...360)
                SettingSlider(name: "Emission angle range", value: $gameConfig.emissionAngleRange, range: 0...360)
                SettingSlider(name: "X Acceleration", value: $gameConfig.xAcceleration, range: -100...100)
                SettingSlider(name: "Y Acceleration", value: $gameConfig.yAcceleration, range: -100...100)
            }
            Section("Rotation") {
                SettingSlider(name: "Particle rotation", value: $gameConfig.particleRotation, range: 0...360)
                SettingSlider(name: "Particle rotation range", value: $gameConfig.particleRotationRange, range: 0...360)
                SettingSlider(name: "Particle rotation speed", value: $gameConfig.particleRotationSpeed, range: -180...180)
            }
        }
        .navigationTitle("Settings")
    }
}

protocol Pickable: Hashable, CaseIterable, RawRepresentable where AllCases == Array<Self> {
    var displayName: String { get }
}

extension Pickable {
    var displayName: String {
        String(describing: self)
    }
}

struct SegmentedPicker<T>: View where T: Pickable {
    let name: String
    @Binding var value: T
    let onChange: ((T) -> Void)?
    
    var body: some View {
        HStack {
            Text(name)
            Picker(selection: $value, label: Text(name)) {
                ForEach(T.allCases, id: \.self) {
                    Text($0.displayName).tag($0)
                }
            }
            .pickerStyle(.segmented)
        }
        .onChange(of: value, perform: onChange ?? { _ in })
    }
}

struct SettingSlider: View {
    let name: String
    @Binding var value: Double
    let range: ClosedRange<Double>
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(name): \(value.formatted(.number.precision(.fractionLength(2))))")
            Slider(value: $value, in: range) {
                Text("Slider")
            }
            HStack {
                Text("\(Int(range.lowerBound))")
                Spacer()
                Text("\(Int(range.upperBound))")
            }
        }
    }
}

struct SettingIcon: View {
    var symbol = "star"
    var size: Double = 23
    var backgroundColor: Color = .clear
    var foregroundColor: Color = .red
    
    var body: some View {
        Image(systemName: symbol)
            .symbolRenderingMode(.hierarchical)
        //            .symbolVariant(.fill)
            .frame(width: size, height: size)
            .foregroundColor(foregroundColor)
            .padding(3)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(backgroundColor)
            )
    }
}

struct SettingLabel: View {
    var text = "Label"
    var icon = SettingIcon()
    
    init(text: String = "Label", icon: SettingIcon) {
        self.text = text
        self.icon = icon
    }
    
    init(text: String = "Label", symbol: String = "star") {
        self.text = text
        self.icon = SettingIcon(symbol: symbol)
    }
    
    var body: some View {
        Label {
            Text(text)
                .lineLimit(1)
        } icon: {
            icon
        }
        //        .labelStyle(.titleOnly)
    }
}
