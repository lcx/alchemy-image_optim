# coding: utf-8
$:.push File.expand_path("../lib", __FILE__)

require 'alchemy/image_optim/version'

Gem::Specification.new do |spec|
  spec.name          = "alchemy-image_optim"
  spec.version       = Alchemy::ImageOptim::VERSION
  spec.authors       = ["Robin Böning"]
  spec.email         = ["rb@magiclabs.de"]
  spec.description   = "Optimizes images after uploaded them to Alchemy CMS."
  spec.summary       = "This gem optimizes all images uploaded to Alchemy CMS by taking advantage of the image-optim gem."
  spec.requirements  << "advancecomp, gifsicle, jhead, jpegoptim, jpeg, optipng, pngcrush"
  spec.homepage      = "http://magiclabs.de"
  spec.license       = "BSD New"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "image_optim"
  spec.add_dependency "alchemy_cms", "~> 3.6"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "rake"
end
