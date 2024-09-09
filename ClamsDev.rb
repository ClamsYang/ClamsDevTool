# -*- coding: UTF-8 -*-
require "sketchup.rb"
require "extensions.rb"
require "date"

module ClamsDev
  module ClamsToolbar
    unless file_loaded?(__FILE__)
      ex = SketchupExtension.new("蛤蜊开发工具", "ClamsDev/core")
      ex.description = "蛤蜊开发工具"
      ex.version = "1.0.0"
      ex.copyright = "ClamsY © 2024"
      ex.creator = "ClamsY"
      Sketchup.register_extension(ex, true)
      file_loaded(__FILE__)
    end
  end # module
end # clamsDev

#ClamsYang 20240829
