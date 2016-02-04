require 'mkdirs/version'
require 'yaml'
require 'fileutils'

module Mkdirs
  include FileUtils

  Spec = Struct.new(:path, :cmd)

  def self.apply_filename(filename, root_dir)
    apply(File.read(filename), root_dir)
  end

  def self.apply(yml, root_dir)
    specs = load(yml)
    specs.each do |spec|
      dir = File.join(root_dir, spec.path)
      mkdir_p(dir)
      if spec.cmd
        Dir.chdir(dir) do
          system(spec.cmd)
        end
      end
    end
  end

  def self.load(yml)
    dirs = YAML.load(yml)
    flatten(dirs)
  end

  private

  #
  # Take a hash
  #   {a: {b: {x: 'foo', y: 'bar'}}}
  # and convert it to an array:
  #   [ Spec('a/b/x', 'foo'), Spec('a/b/y', 'bar') ]
  #
  def self.flatten(o, path = "")
    return Spec.new(path, o) unless o.kind_of?(Hash)
    o.map do |segment, value|
      flatten(value, File.join(path, segment))
    end.flatten
  end

end
