#       core.rb
#       
#       Copyright (C) 2015 Jan Brouwer <jan@brewsky.nl>
#       
#       This program is free software: you can redistribute it and/or modify
#       it under the terms of the GNU General Public License as published by
#       the Free Software Foundation, either version 3 of the License, or
#       (at your option) any later version.
#       
#       This program is distributed in the hope that it will be useful,
#       but WITHOUT ANY WARRANTY; without even the implied warranty of
#       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#       GNU General Public License for more details.
#       
#       You should have received a copy of the GNU General Public License
#       along with this program.  If not, see <http://www.gnu.org/licenses/>.

module Brewsky
  module Layers2Materials
    extend self
    
    # recursively scan the model for faces
    def self.scan( entities )
      entities.each do |ent|
        case ent
        when Sketchup::Face
          ent.material = ent.layer.name
          ent.back_material = ent.layer.name
        when Sketchup::Group
          scan( ent.entities )
        when Sketchup::ComponentInstance
          scan( ent.definition.entities )
        end
      end
    end
    
    # add to the extension menu
    UI.menu("Extensions").add_item("Layers naar materialen") {
  
      model = Sketchup.active_model
      entities = model.entities
      layers = model.layers
      materials = model.materials
    
      # create materials from layers
      layers.each do |layer|
        name = layer.name
        unless materials[name]
          material = materials.add( name )
          #material.color = "White"
          material.color = layer.color
        end
      end
      
      # start search
      scan( model.entities )
    }
    
  end # module Layers2Materials
end # module Brewsky
