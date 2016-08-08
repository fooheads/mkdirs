require 'mkdirs/version'
require 'yaml'
require 'fileutils'
require 'colorize'

include FileUtils

module Mkdirs

  Spec = Struct.new(:path, :cmd)

  def self.apply_filename(filename, root_dir)
    apply(File.read(filename), root_dir)
  end

  def self.apply(yml, root_dir, verbose = true)
    specs = load(yml)
    specs.each do |spec|
      path = File.join(root_dir, spec.path)
      dir = File.dirname(path)
      unless File.exists?(dir)
        puts "mkdir -p #{dir}".colorize(:green) if verbose
        mkdir_p(dir)
      end
      if spec.cmd
        if not File.exists?(path)
          Dir.chdir(dir) do
            puts spec.cmd.colorize(:green) if verbose
            system(spec.cmd)
            exit($?.exitstatus) if $?.exitstatus != 0
          end
        end
      else
        puts "mkdir -p #{path}".colorize(:green) if verbose
        mkdir_p(path)
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
