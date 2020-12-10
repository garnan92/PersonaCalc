// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let personaSkills = try PersonaSkills(json)

import Foundation

// MARK: - PersonaSkill
public struct PersonaSkill: Codable {
    public let skill: Skill?

    enum CodingKeys: String, CodingKey {
        case skill
    }

    public init(skill: Skill?) {
        self.skill = skill
    }
}

// MARK: PersonaSkill convenience initializers and mutators

public extension PersonaSkill {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(PersonaSkill.self, from: data)
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
        skill: Skill?? = nil
    ) -> PersonaSkill {
        return PersonaSkill(
            skill: skill ?? self.skill
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Skill
public struct Skill: Codable {
    public let name: String?
    public let cost: String?
    public let efect: String?
    public let level: String?

    enum CodingKeys: String, CodingKey {
        case name
        case cost
        case efect
        case level
    }

    public init(name: String?, cost: String?, efect: String?, level: String?) {
        self.name = name
        self.cost = cost
        self.efect = efect
        self.level = level
    }
}

// MARK: Skill convenience initializers and mutators

public extension Skill {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Skill.self, from: data)
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
        name: String?? = nil,
        cost: String?? = nil,
        efect: String?? = nil,
        level: String?? = nil
    ) -> Skill {
        return Skill(
            name: name ?? self.name,
            cost: cost ?? self.cost,
            efect: efect ?? self.efect,
            level: level ?? self.level
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

public typealias PersonaSkills = [PersonaSkill]

public extension Array where Element == PersonaSkills.Element {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(PersonaSkills.self, from: data)
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
