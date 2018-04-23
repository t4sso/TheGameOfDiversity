import SpriteKit
import UIKit
import PlaygroundSupport
import Foundation


public var speciesNodes: [Species] = []
public var threatNodes: [ThreatNode] = []
public var deadNodes: Set<Int> = []
public var survivingNodes: [Species] = []
public var affectedShapes: [SKShapeNode] = []
public var newNodes: [Species] = []


public var genePool:Int = exampleGenes.count
public var exampleGenes: [Gene] = [Gene(geneID: 20, geneColor: blue), Gene(geneID: 21, geneColor: yellow), Gene(geneID: 22, geneColor: brown), Gene(geneID: 23, geneColor: pink), Gene(geneID: 24, geneColor: purple), Gene(geneID: 25, geneColor: green)]

public let pink = UIColor.init(red: 255/255, green: 112/255, blue: 143/255, alpha: 1.0)
public let blue = UIColor.init(red: 99/255, green: 151/255, blue: 255/255, alpha: 1.0)
public let yellow = UIColor.init(red: 255/255, green: 223/255, blue: 94/255, alpha: 1.0)
public let brown = UIColor.init(red: 232/255, green: 149/255, blue: 90/255, alpha: 1.0)
public let purple = UIColor.init(red: 166/255, green: 90/255, blue: 232/255, alpha: 1.0)
public let green = UIColor.init(red: 48/255, green: 255/255, blue: 141/255, alpha: 1.0)


public let speciesNames = ["Dinosaurs", "Frogs", "Butterflies", "Hamsters", "Dogs", "Mosquitos", "Spiders", "Rhinos", "Gazelles", "Parrots", "Velociraptors", "Bunnies", "Whales", "Goldfish", "Dolphins", "Ants", "Camels", "Iguanas", "Hummingbirds"]

public enum geneDiversityLevels: String {
    case Highest
    case High
    case Medium
    case Low
    case Lowest
    init() {
        self = .Highest
    }
}


public var geneDiversityLevel: geneDiversityLevels = .Highest

public func setDiversityLevel() {
    switch geneDiversityLevel {
    case .Highest:
        genePool = exampleGenes.count
    case .High:
        genePool = exampleGenes.count - 1
    case .Medium:
        genePool = exampleGenes.count - 2
    case .Low:
        genePool = exampleGenes.count - 3
    case .Lowest:
        genePool = exampleGenes.count - 4
    }
}

public func createRandomSpecies(numberOfSpeciesToCreate: Int, speciesCollection: Int, genePositions: Int) {
    
    for _ in 0 ... numberOfSpeciesToCreate - 1 {
        let randomName = speciesNames[Int(arc4random_uniform(UInt32(speciesNames.count)))]
        var randomGenes:[Gene] = []
        for _ in 0 ... genePositions - 1 {
            randomGenes.append(exampleGenes[Int(arc4random_uniform(UInt32(genePool)))])
        }
        let shape = speciesShapeCreator(geneShapes: geneCreator(genes: randomGenes), genePositions: genePositions, offSpring: false)
        let species = Species(name: randomName, genePositions: genePositions, genes: randomGenes, health: 100.0, drawShape: shape)
        if speciesCollection == 0 {
            speciesNodes.append(species)
        } else if speciesCollection == 1 {
            newNodes.append(species)
        }
    }
    
}


//Create colored Genes to include in each Species
public func geneCreator(genes: [Gene]) -> [SKShapeNode] {
    var geneShapes: [SKShapeNode] = []
    var colorsOfGenes: [UIColor] = []
    for i in 0 ... genes.count - 1 {
        colorsOfGenes.append(genes[i].geneColor)
    }
    
    let path = CGMutablePath()
    path.addArc(center: CGPoint.zero, radius: 5.5, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
    for i in 0 ... genes.count - 1 {
        let gene1 = SKShapeNode(path: path)
        gene1.lineWidth = 0
        gene1.fillColor = colorsOfGenes[i]
        gene1.strokeColor = colorsOfGenes[i]
        gene1.glowWidth = 0
        geneShapes.append(gene1)
        
        
    }
    return geneShapes
}

// Create Species and position Genes inside of them
public func speciesShapeCreator(geneShapes: [SKShapeNode], genePositions: Int, offSpring: Bool) -> SKShapeNode {
    
    let path = CGMutablePath()
    path.addArc(center: CGPoint.zero, radius: 45, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
    let speciesShape = SKShapeNode(path: path)
    speciesShape.lineWidth = 0
    var speciesColor: UIColor = UIColor.init(red: 90/255, green: 152/255, blue: 153/255, alpha: 1.0)
    
    if offSpring == true {
        speciesColor = UIColor.init(red: 18/255, green: 201/255, blue: 204/255, alpha: 1.0)
    } else if offSpring == false {
        speciesColor = UIColor.init(red: 90/255, green: 152/255, blue: 153/255, alpha: 1.0)
    }
    speciesShape.fillColor = speciesColor
    speciesShape.strokeColor = speciesColor
    speciesShape.glowWidth = 0
    
    if geneShapes.count > 0 {
        geneShapes[0].position.x = geneShapes[0].position.x + 7.5
        geneShapes[0].position.y = geneShapes[0].position.y + 7.5 }
    if geneShapes.count > 1 {
        geneShapes[1].position.x = geneShapes[1].position.x + 25
        geneShapes[1].position.y = geneShapes[1].position.y + 7.5 }
    if geneShapes.count > 2 {
        geneShapes[2].position.x = geneShapes[2].position.x + 7.5
        geneShapes[2].position.y = geneShapes[2].position.y + 25.0 }
    if geneShapes.count > 3 {
        geneShapes[3].position.x = geneShapes[3].position.x + 25.7
        geneShapes[3].position.y = geneShapes[3].position.y + 25.0 }
    if geneShapes.count > 4 {
        geneShapes[4].position.x = geneShapes[4].position.x + 7.5
        geneShapes[4].position.y = geneShapes[4].position.y - 7.5 }
    if geneShapes.count > 5 {
        geneShapes[5].position.x = geneShapes[5].position.x + 25
        geneShapes[5].position.y = geneShapes[5].position.y - 7.5 }
    if geneShapes.count > 6 {
        geneShapes[6].position.x = geneShapes[6].position.x + 7.5
        geneShapes[6].position.y = geneShapes[6].position.y - 25 }
    if geneShapes.count > 7 {
        geneShapes[7].position.x = geneShapes[7].position.x + 25
        geneShapes[7].position.y = geneShapes[7].position.y - 25 }
    
    
    for i in 0 ... genePositions - 1 {
        speciesShape.addChild(geneShapes[i])
    }
    return speciesShape
}


public func drawShapes(numberOfSpeciesToDraw: Int, speciesCollection: Int, scene: SKScene, genePositions: Int)  {
    createRandomSpecies(numberOfSpeciesToCreate: numberOfSpeciesToDraw, speciesCollection: speciesCollection, genePositions: genePositions)
    if speciesCollection == 0 {
        for i in 0 ... speciesNodes.count - 1 {
            scene.addChild(speciesNodes[i].drawShape)
        }
    }
    else if speciesCollection == 1 {
        for i in 0 ... newNodes.count - 1 {
            scene.addChild(newNodes[i].drawShape)
        }
    }
}

//Define our Ecosystem: Genes, Species and Threats

public func moveSpeciesToPosition(allSpecies: [Species], scene: SKScene, duration: Double) {
    
    let angleBetweenSpecies = Double( (2 * Double.pi) / Double(allSpecies.count))
    
    let ecoSystemRadius = scene.size.height * 0.3
    var nodeShapes: [SKShapeNode] = []
    for i in 0 ... allSpecies.count - 1 {
        nodeShapes.append(allSpecies[i].drawShape)
        var positionInView = CGPoint(x: CGFloat(scene.size.width / 2), y: CGFloat(scene.size.height / 2))
        allSpecies[i].drawShape.position = CGPoint(x: CGFloat(scene.size.width / 2), y: CGFloat(scene.size.height / 2))
        positionInView.x += ecoSystemRadius * CGFloat(cos( Double(i) * angleBetweenSpecies))
        positionInView.y += ecoSystemRadius * CGFloat(sin( Double(i) * angleBetweenSpecies))
        allSpecies[i].drawShape.run(SKAction.repeatForever(SKAction.move(to: positionInView, duration: duration)))
        let pulseIn = SKAction.scale(to: 0.93, duration: 2.7)
        let pulseOut = SKAction.scale(to: 1.07, duration: 2.7)
        let wait = SKAction.wait(forDuration: 0.3)
        let seq = SKAction.sequence([pulseIn, wait, pulseOut, wait])
        allSpecies[i].drawShape.run(SKAction.repeatForever(seq), withKey: "pulse")
        
    }
}

public func positionSpecies(number: Int, genePositions: Int, speciesCollection: Int, scene: SKScene, animationDuration: Double) {
    setDiversityLevel()
    drawShapes(numberOfSpeciesToDraw: number, speciesCollection: speciesCollection, scene: scene, genePositions: genePositions)
    if speciesCollection == 0 {
        moveSpeciesToPosition(allSpecies: speciesNodes, scene: scene, duration: animationDuration) }
    else if speciesCollection == 1 {
        moveSpeciesToPosition(allSpecies: newNodes, scene: scene, duration: animationDuration) }
    
}

public func createThreats(numberOfThreatsToDraw: Int, gene: Gene, scene: SKScene, attackIntensity: Double, attackRadius: Double, attackDuration: Double) {
    
    let angleBetweenThreats = Double( (2 * Double.pi) / Double(numberOfThreatsToDraw))
    let attackPerimeter = scene.size.height * 0.55 * CGFloat(attackRadius)
    threatNodes = []
    for _ in 0 ... numberOfThreatsToDraw - 1 {
        var attacker = SKSpriteNode(imageNamed: "Threat Yellow2x")
        
        if gene.geneColor == pink {
            let texture = SKTexture(imageNamed: "Threat Pink2x")
            texture.filteringMode = .linear
            attacker = SKSpriteNode(texture:texture)
            attacker.run(SKAction.scale(to: 0.5, duration:0.01))
        }
        else if gene.geneColor == green {
            let texture = SKTexture(imageNamed: "Threat Green2x")
            texture.filteringMode = .linear
            attacker = SKSpriteNode(texture:texture)
            attacker.run(SKAction.scale(to: 0.5, duration:0.01))
        }
        else if gene.geneColor == yellow {
            let texture = SKTexture(imageNamed: "Threat Yellow2x")
            texture.filteringMode = .linear
            attacker = SKSpriteNode(texture:texture)
            attacker.run(SKAction.scale(to: 0.5, duration:0.01))
        }
        else if gene.geneColor == purple {
            let texture = SKTexture(imageNamed: "Threat Purple2x")
            texture.filteringMode = .linear
            attacker = SKSpriteNode(texture:texture)
            attacker.run(SKAction.scale(to: 0.5, duration:0.01))
        }
        else if gene.geneColor == blue {
            let texture = SKTexture(imageNamed: "Threat Blue2x")
            texture.filteringMode = .linear
            attacker = SKSpriteNode(texture:texture)
            attacker.run(SKAction.scale(to: 0.5, duration:0.01))
        }
        else {
            let texture = SKTexture(imageNamed: "Threat Yellow2x")
            texture.filteringMode = .linear
            attacker = SKSpriteNode(texture:texture)
            attacker.run(SKAction.scale(to: 0.5, duration:0.01))
        }
        let threat = ThreatNode(name: "", attackedGene: gene, attackIntensity: attackIntensity, drawShape: attacker)
        threatNodes.append(threat)
    }
    
    for i in 0...threatNodes.count - 1 {
        var positionInView: CGPoint = CGPoint(x: CGFloat(scene.size.width / 2), y: CGFloat(scene.size.height / 2))
        var initPositionInView: CGPoint = CGPoint(x: CGFloat(scene.size.width / 2), y: CGFloat(scene.size.height / 2))
        positionInView.x += 0.8 * attackPerimeter * CGFloat(cos( Double(i) * angleBetweenThreats))
        positionInView.y += 0.8 * attackPerimeter * CGFloat(sin( Double(i) * angleBetweenThreats))
        threatNodes[i].drawShape.run(SKAction.rotate(byAngle: CGFloat((Double.pi / 2) + ( Double(i) * angleBetweenThreats)), duration: 0))
        initPositionInView.x += 2.8 * attackPerimeter * CGFloat(cos( Double(i) * angleBetweenThreats))
        initPositionInView.y += 2.8 * attackPerimeter * CGFloat(sin( Double(i) * angleBetweenThreats))
        threatNodes[i].drawShape.run(SKAction.move(to: initPositionInView, duration: 0))
        scene.addChild(threatNodes[i].drawShape)
        threatNodes[i].drawShape.run(SKAction.move(to: positionInView, duration: attackDuration), withKey: "attack")
    }
}
public func shrinkAffectedSpecies (scene: SKScene, attackIntensity: Double, shrinkDuration: Double) {
    let shrinkAction = SKAction.scale(by: 0.55, duration: shrinkDuration)
    let reduce = SKAction.scale(by: 0.05, duration: shrinkDuration + 3.0)
    let fade = SKAction.fadeOut(withDuration: 4.0)
    let wait = SKAction.wait(forDuration: 6)
    let removeNode = SKAction.removeFromParent()
    let group = SKAction.group([fade, reduce])
    let deathSequence = SKAction.sequence([group, removeNode])
    let shrinkSequence = SKAction.sequence([shrinkAction, wait])
    deadNodes = []
    
    if speciesNodes.count == 0 {
        print("It looks like there are no survivors in this ecosystem.")
       // PlaygroundPage.current.assessmentStatus = .pass(message: "It looks like there are no survivors in this ecosystem. Try increasing the gene diversity level.")
    } else {
    
    
    for i in 0 ... speciesNodes.count - 1 {
        for j in 0 ... speciesNodes[i].genes.count - 1 {
            if speciesNodes[i].genes[j].geneID == threatNodes[i].attackedGene.geneID {
                //print("why die? \(speciesNodes[i].health - Double(attackIntensity * 40))")
                speciesNodes[i].health = speciesNodes[i].health - Double(attackIntensity * 40)
            }
        }
        
        if speciesNodes[i].health < 30.0 {
            deadNodes.insert(i)
            print("added to deadNodes")
            speciesNodes[i].drawShape.run(_: deathSequence)
            
            
        } else if speciesNodes[i].health < 100.0 {
            
            speciesNodes[i].drawShape.removeAction(forKey: "pulse")
            speciesNodes[i].drawShape.run(_: shrinkSequence)
            let pulseIn = SKAction.scale(to: 0.48, duration: 2.7)
            let pulseOut = SKAction.scale(to: 0.62, duration: 2.7)
            let wait = SKAction.wait(forDuration: 0.3)
            let seq = SKAction.sequence([pulseIn, wait, pulseOut, wait])
            speciesNodes[i].drawShape.run(SKAction.repeatForever(seq))
            
        }
    }
    }
    
    if deadNodes.count > 0 {
        
        survivingNodes = speciesNodes.enumerated().filter({ !deadNodes.contains($0.0) }).map { $0.1 }
        
        print("Surviving: \(survivingNodes.count)")
    }
}

public func attack(threats: Int, gene: Gene, scene: SKScene, attackIntensity: Double, attackRadius: Double, attackDuration: Double, shrinkDuration: Double) {
    createThreats(numberOfThreatsToDraw: threats, gene: gene, scene: scene, attackIntensity: attackIntensity, attackRadius: attackRadius, attackDuration: attackDuration)
    shrinkAffectedSpecies(scene: scene, attackIntensity: attackIntensity, shrinkDuration: shrinkDuration)
}



public func createOffSprings(numberOfSpeciesToCreate: Int, speciesCollection: Int, genePositions: Int) {
    
    var survivingGenes: [Gene] = []
    for i in 0 ... survivingNodes.count - 1 {
        for j in 0 ... survivingNodes[i].genes.count - 1 {
            survivingGenes.append(survivingNodes[i].genes[j])
            
        }
    }
    print("we had \(survivingGenes.count) surviving genes")
    
    for _ in 0 ... numberOfSpeciesToCreate - 1 {
        
        
        let randomName = speciesNames[Int(arc4random_uniform(UInt32(speciesNames.count)))]
        var randomGenes:[Gene] = []
        for _ in 0 ... genePositions - 1 {
            randomGenes.append(survivingGenes[Int(arc4random_uniform(UInt32(survivingGenes.count)))])
        }
        let shape = speciesShapeCreator(geneShapes: geneCreator(genes: randomGenes), genePositions: genePositions, offSpring: true)
        let species = Species(name: randomName, genePositions: genePositions, genes: randomGenes, health: 100.0, drawShape: shape)
        if speciesCollection == 0 {
            speciesNodes.append(species)
        } else if speciesCollection == 1 {
            newNodes.append(species)
        }
    }
    
}

public func cleanThreat(threats: Int, gene: Gene, scene: SKScene, attackIntensity: Double, attackRadius: Double, attackDuration: Double, shrinkDuration: Double) {
    
    for i in 0 ... threatNodes.count - 1 {
        let wait = SKAction.wait(forDuration: 4.0)
        let fade = SKAction.fadeOut(withDuration: 3.0)
        let removeNode = SKAction.removeFromParent()
        let reduce = SKAction.scale(by: 0.05, duration: 3.0)
        let group = SKAction.group([fade, reduce])
        let deathSequence = SKAction.sequence([wait, group, removeNode])
        threatNodes[i].drawShape.run(_: deathSequence)
    }
    threatNodes.removeAll()
    
    //createThreats(numberOfThreatsToDraw: threats, gene: gene, scene: scene, attackIntensity: attackIntensity, attackRadius: attackRadius, attackDuration: attackDuration)
    // shrinkAffectedSpecies(scene: scene, attackIntensity: attackIntensity, shrinkDuration: shrinkDuration)
}
public func growthCycle(scene: SKScene, genePositions: Int, number: Int) {
    
    
    
    var newNodesCount = Int(ceil(Double(survivingNodes.count) * 1.3)) - survivingNodes.count
    if newNodesCount < 2 {
        newNodesCount = 2
    }
    //print("Will increase by: \(newNodesCount)")
    

    var survivingGenes: [Gene] = []
    if survivingNodes.count == 0 {
        //print("It looks like there are no survivors in this ecosystem.")
        // PlaygroundPage.current.assessmentStatus = .pass(message: "It looks like there are no survivors in this ecosystem. Try increasing the gene diversity level.")
    } else {
        for i in 0 ... survivingNodes.count - 1 {
            for j in 0 ... survivingNodes[i].genes.count - 1 {
                survivingGenes.append(survivingNodes[i].genes[j])
                
            }
        }
        //print("we had \(survivingGenes.count) surviving genes")
        
        for _ in 0 ... newNodesCount - 1 {
            
            
            let randomName = speciesNames[Int(arc4random_uniform(UInt32(speciesNames.count)))]
            var randomGenes:[Gene] = []
            for _ in 0 ... min(8,genePositions) - 1 {
                randomGenes.append(survivingGenes[Int(arc4random_uniform(UInt32(survivingGenes.count)))])
            }
            let shape = speciesShapeCreator(geneShapes: geneCreator(genes: randomGenes), genePositions: min(8,genePositions), offSpring: true)
            let species = Species(name: randomName, genePositions: min(8,genePositions), genes: randomGenes, health: 100.0, drawShape: shape)
            
            
            newNodes.append(species)
            
        }
        
        
        print("created \(newNodes.count), old: \(survivingNodes.count)")
        let angleBetweenNewNodes = Double( (2 * Double.pi) / Double(newNodes.count))
        
        let newNodesRadius = scene.size.height * 0.1
        var nodeShapes: [SKShapeNode] = []
        for j in 0 ... newNodes.count - 1 {
            
            nodeShapes.append(newNodes[j].drawShape)
            var positionInView = CGPoint(x: CGFloat(scene.size.width / 2), y: CGFloat(scene.size.height / 2))
            newNodes[j].drawShape.position = CGPoint(x: CGFloat(scene.size.width / 2), y: CGFloat(scene.size.height / 2))
            positionInView.x += newNodesRadius * CGFloat(cos( Double(j) * angleBetweenNewNodes))
            positionInView.y += newNodesRadius * CGFloat(sin( Double(j) * angleBetweenNewNodes))
            let disappear = SKAction.fadeOut(withDuration: 0.001)
            scene.addChild(newNodes[j].drawShape)
            newNodes[j].drawShape.run(disappear)
            let appear = SKAction.fadeIn(withDuration: 1.4)
            //let fadeIn = SKAction.fadeIn(withDuration:5)
            let wait = SKAction.wait(forDuration: 5)
            let run = SKAction.move(to: positionInView, duration: 2.0)
            let sequence = SKAction.sequence([wait, appear, run])
            newNodes[j].drawShape.run(sequence)
            
        }
    }
    cleanThreat(threats: number, gene: exampleGenes[1], scene: scene, attackIntensity: 0.6, attackRadius: 1.0, attackDuration: 2.0, shrinkDuration: 2.5)
    
    
    let shrinkAction = SKAction.scale(by: 0.55, duration: 14.5)
    let reduce = SKAction.scale(by: 0.05, duration: 8 + 3.0)
    let fade = SKAction.fadeOut(withDuration: 4.0)
    let wait = SKAction.wait(forDuration: 6)
    let removeNode = SKAction.removeFromParent()
    let group = SKAction.group([fade, reduce])
    let deathSequence = SKAction.sequence([group, removeNode])
    let shrinkSequence = SKAction.sequence([shrinkAction, wait])
    deadNodes = []
    survivingNodes = survivingNodes + newNodes
    
    
    //optional: show a second attacker after growth cycle
    //createThreats(numberOfThreatsToDraw: survivingNodes.count, gene: exampleGenes[2], scene: scene, attackIntensity: 0.9, attackRadius: 0.95, attackDuration: 13.0)
}
/*
 
 */

