Gem::Specification.new do |s|
  s.name        = 'dagenerator'
  s.version     = '0.0.1'
  s.date        = '2017-03-04'
  s.summary     = 'Data Generator'
  s.description = 'A tool for generating scattered unmerged data for testing'
  s.authors     = ['Gregory Doran']
  s.email       = 'greg@gregorydoran.co.uk'
  s.files       = Dir["{bin,lib}/**/*", "LICENSE", "README.md"]
  s.executables = %w(dagenerator)
  s.homepage    =
    'http://rubygems.org/gems/dagenerator'
  s.license       = 'MIT'

  s.add_dependency 'factory_girl', '~> 4.8'
  s.add_dependency 'faker', '~> 1.7'
  s.add_dependency 'activesupport', '~> 5'
end