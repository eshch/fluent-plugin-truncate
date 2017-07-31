# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name = 'fluent-plugin-truncate'
  spec.version = '0.0.1'
  spec.authors = ['eshch']
  spec.email = ['eshchetinin@gmail.com']
  spec.description = 'A fluent plugin to truncate the record fields in various ways'
  spec.summary = 'A fluent plugin to truncate the record fields in various ways'

  spec.require_paths = ['lib']

  spec.add_dependency 'fluentd'
end
