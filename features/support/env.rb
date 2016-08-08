$LOAD_PATH.unshift File.expand_path('../../../lib', __FILE__)

require 'mkdirs'
require 'fileutils'
require 'rspec'

include FileUtils

Before do
  @root = File.join(File.dirname(__FILE__), "testdirs")
  mkdir(@root)
end

After do
  rm_rf(@root)
end

def mkdirs(yml)
  Mkdirs.apply(yml, @root, false)
  Dir.chdir(@root) do
    Dir.glob('**/*').join("\n")
  end
end

def dir_structure(text)
  unindent(text).chomp
end

def unindent(s) 
  s.gsub /^\s+/, ''
end



