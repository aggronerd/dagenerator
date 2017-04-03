# Data generator ("dagenerator")

## Description

A simple utility that can generate tabular test data files. The aim is to provide test data for data cleansing tools, but it has possibly other uses. 

* Uses "factories" to generate test "entities" which are shared randomly between possible output files.
* The files that are generated can have different columns.
* Outputs can be customised to introduce a variety of random errors according to a set of rules.
* Can be extended to support new types of factories.
* Data generation rules are defined using YAML.

Please see the presets for examples of how to create your own rules.

## Installation

```bash
gem install specific_install
gem specific_install -l https://github.com/aggronerd/dagenerator.git
```

## Usage

### Listing of presets

There are a collection of example presets generation rules. You can list their names using:

```bash
dagenerator --list-presets 
```

### Generating data according to preset rules

To generate data for a preset:

```bash
dagenerator --preset contacts
```

### Printing preset examples

Rules for data generation are represented in YAML. To print the YAML for the presets you can use the following arguements:

```bash
dagenerator --preset contacts --print
```

### Using custom rules
 
Load generation rules from file using:

```bash
dageneration --file businesses.yml 
```

## Configuration

### Supported factories

* 'person' - Generates people see [lib/data_generator/factories/person_factory.rb]

You can of course add your own by forking this project, but please do make a pull request to add your factory to the 
aggronerd's fork on github.

## Acknowledgements

This tool heavily relies on [Factory Girl](https://github.com/thoughtbot/factory_girl) and [Faker](https://github.com/stympy/faker) gems.

## Development

Using RVM ensure you have the version of ruby specified in .ruby-version. Then install bundler and install the required gems:

```bash
gem install bundler
```

```bash
bundle install
```