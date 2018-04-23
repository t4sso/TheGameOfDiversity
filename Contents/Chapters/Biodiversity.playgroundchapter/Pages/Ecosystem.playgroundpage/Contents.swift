//#-hidden-code
import SpriteKit
import UIKit
import PlaygroundSupport
//SpriteKit scene for our ecosystem. Create it and add it to the view.
let view:SKView = SKView(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.height))
PlaygroundPage.current.liveView = view
let ecoScene:SKScene = SKScene(size: CGSize.init(width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.height))
ecoScene.anchorPoint = view.center
ecoScene.scaleMode = SKSceneScaleMode.aspectFit
view.backgroundColor = UIColor.init(red: 74/255, green: 74/255, blue: 74/255, alpha: 1.0)
ecoScene.backgroundColor = UIColor.init(red: 74/255, green: 74/255, blue: 74/255, alpha: 1.0)
ecoScene.anchorPoint = CGPoint(x: 0, y: 0)
view.presentScene(ecoScene)
var lifeForms = 10
var numberOfGenes = 4
//#-end-hidden-code
//:# The ecosystem
//: A living web of species
//:## Biodiversity
//: Plants and animals depend on each other and on their physical environments to keep our entire system alive and well. The living web is held together not by nails or glue, but by interdependence — one strand stays in place because it is linked with many others.
//:
//: Biodiversity refers to the variety of living things, just like in a forest where you see trees, plants, deer, spiders, birds, etc. Biodiversity is important because it helps prevent any one gene, species, or ecosystem from throwing nature out of balance.
lifeForms =  10
numberOfGenes = 4
//: Try to change `lifeForms` again to create more species (maximum 20). You can also change `numberOfGenes` to any integer between 1 and 8. This will determine how many genes are in each species. Complex organisms (like dolphins) have more genes than simpler ones (like ants).
//:
//: Our ecosystem is not always safe though... [a threat is approaching](@next).
//#-hidden-code
geneDiversityLevel = .Highest
positionSpecies(number: lifeForms, genePositions: numberOfGenes, speciesCollection: 0, scene: ecoScene, animationDuration: 2.5)//#-end-hidden-code
