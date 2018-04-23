# The Game of Diversity

![The Game of Diversity](Assets/The%20Game%20of%20Diversity.gif?raw=true)

## My WWDC 2018 scholarship submission (accepted).

The goal with this playground was to explore how to best convey the importance of diversity to a young audience. Biodiversity (as an example from nature) but also social and cultural diversity have traditionally been explained in a dry, academic way. I wanted to create a better way. I wanted young kids to visually explore this concept by interacting with the iPad, get more engaged and ‘feel’ the importance of diversity more deeply.

I began by creating a few playground pages on Xcode, and eventually moved them to a playground book (created from the Starter playground book from the Apple Developer website) that can handle the presentation of the content as more scenes and interactions are added to it.

In order to keep the user interested in exploring the topic, I had to design simple, colorful graphics, and convey a feeling of  real, breathing life in the abstract representations of species, genes, and ecosystems. The circle was a basic symbol for everything in this game.

I created some basic shapes to represent the concepts/nodes, and then used Swift’s trigonometric functions to calculate their movements and positions. Most shapes are simple path-based drawings by Core Graphics. The result is a color managed, high-fidelity output that works well on any display. SpriteKit allowed me to add animations and effects and managed creating and moving all nodes, handling synchronization, interactions and animation sequences. 

Frameworks used:
- SpriteKit
- UIKit
- Core Graphics
