# layers2materials
SketchUp extension that sets the material for every face in the model based on the layer the face is on.

This extension helps me to improve the 3d-DWG data imported in SketchUp from our Adomi BIM-modeller.
Adomi places every face on a layer with the same name as it's original building material.
Using this tool you can match the SketchUp materials with the original Adomi materials.

Install the extension in SketchUp:
Window --> Preferences --> Extensions --> Install Extension (find the rbz-file).
This should add the "Create materials out of layers" option to the Extensions menu.

When started the plugin does the following:
 - creates new materials for all existing layers (color matching the layer color)
 - replaces the material of every face in the model by the new material matching the layer the face is on.
