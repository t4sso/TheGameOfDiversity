import SpriteKit
import UIKit
import PlaygroundSupport
import Foundation


public struct Gene: Hashable, Equatable  {
    public var geneID: Int
    public var geneColor: UIColor
    public init(geneID: Int, geneColor: UIColor) {
        self.geneID = geneID
        self.geneColor = geneColor
    }
    public static func ==(lhs: Gene, rhs: Gene) -> Bool {
        return lhs.geneID == rhs.geneID
    }
    public var hashValue: Int {
        return geneID.hashValue ^ geneID.hashValue &* 8789722878
    }
}
public struct Species: Hashable, Equatable {
    public var name: String
    public var genePositions: Int
    public var health: Double
    public var genes: [Gene]
    public var drawShape: SKShapeNode
    
    public init(name: String, genePositions: Int, genes: [Gene], health: Double, drawShape: SKShapeNode) {
        self.name = name
        self.genePositions = genePositions
        self.genes = genes
        self.health = health
        self.drawShape = drawShape
        
        
    }
    public static func ==(lhs: Species, rhs: Species) -> Bool {
        return lhs.name == rhs.name && lhs.genes == rhs.genes
    }
    public var hashValue: Int {
        return name.hashValue ^ name.hashValue &* 878973897878
    }
    
}

public class SpeciesShape {
    public var species : Species
    public var shape : SKShapeNode
    public init(species: Species, shape: SKShapeNode) {
        self.species = species
        self.shape = shape
    }
    
}

public struct ThreatNode {
    public var name: String
    public var attackedGene: Gene
    public var attackIntensity: Double
    public var drawShape: SKSpriteNode
    public init(name: String, attackedGene: Gene, attackIntensity: Double, drawShape: SKSpriteNode) {
        self.name = name
        self.attackedGene = attackedGene
        self.attackIntensity = attackIntensity
        self.drawShape = drawShape
    }
    
}

