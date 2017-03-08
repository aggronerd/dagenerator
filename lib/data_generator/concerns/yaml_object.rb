require 'yaml'

module DataGenerator
  module YamlObject
    def from_yaml(yaml)
      new(YAML.load(yaml))
    end
  end
end