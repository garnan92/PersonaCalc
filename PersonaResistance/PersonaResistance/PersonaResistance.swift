// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let personaResistance = try PersonaResistance(json)

import Foundation

// MARK: - PersonaResistance
public struct PersonaResistance: Codable {
    public let phys: String?
    public let gun: String?
    public let fire: String?
    public let ice: String?
    public let elec: String?
    public let wind: String?
    public let psy: String?
    public let nuke: String?
    public let bless: String?
    public let curse: String?

    enum CodingKeys: String, CodingKey {
        case phys
        case gun
        case fire
        case ice
        case elec
        case wind
        case psy
        case nuke
        case bless
        case curse
    }

    public init(phys: String?, gun: String?, fire: String?, ice: String?, elec: String?, wind: String?, psy: String?, nuke: String?, bless: String?, curse: String?) {
        self.phys = phys
        self.gun = gun
        self.fire = fire
        self.ice = ice
        self.elec = elec
        self.wind = wind
        self.psy = psy
        self.nuke = nuke
        self.bless = bless
        self.curse = curse
    }
}

// MARK: PersonaResistance convenience initializers and mutators

public extension PersonaResistance {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(PersonaResistance.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        phys: String?? = nil,
        gun: String?? = nil,
        fire: String?? = nil,
        ice: String?? = nil,
        elec: String?? = nil,
        wind: String?? = nil,
        psy: String?? = nil,
        nuke: String?? = nil,
        bless: String?? = nil,
        curse: String?? = nil
    ) -> PersonaResistance {
        return PersonaResistance(
            phys: phys ?? self.phys,
            gun: gun ?? self.gun,
            fire: fire ?? self.fire,
            ice: ice ?? self.ice,
            elec: elec ?? self.elec,
            wind: wind ?? self.wind,
            psy: psy ?? self.psy,
            nuke: nuke ?? self.nuke,
            bless: bless ?? self.bless,
            curse: curse ?? self.curse
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
