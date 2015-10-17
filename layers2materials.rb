#       layers2materials.rb
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

# Extention that searches the entire model and creates materials for every layer. 

require 'sketchup.rb'
require 'extensions.rb'

module Brewsky
  PLUGIN_ROOT_PATH = File.dirname(__FILE__) unless defined? PLUGIN_ROOT_PATH
  AUTHOR_PATH = File.join(PLUGIN_ROOT_PATH, 'Brewsky') unless defined? AUTHOR_PATH
  
  module Layers2Materials
    PATH  = File.join(AUTHOR_PATH, 'layers2materials') # must be moved to author path

    # Create Extension
    layers2materials = SketchupExtension.new "layers2materials", File.join( PATH, 'core.rb' )
    layers2materials.version = '0.13.3'
    layers2materials.description = "Extention that searches the entire model and creates materials for every layer."
    Sketchup.register_extension layers2materials, true
  end # module Layers2Materials
end # module Brewsky
