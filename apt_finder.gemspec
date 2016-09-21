# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'apt_finder/version'

Gem::Specification.new do |spec|
  spec.name          = "apt_finder"
  spec.version       = AptFinder::VERSION
  spec.authors       = ["yeungn"]
  spec.email         = ["nin.yeung@gmail.com"]

  spec.summary       = %q{Apartment Finder}
  spec.description   = %q{Scraper to get current listings from Apartmentfinder}
  spec.homepage      = "https://rubygems.org/gems/apt_finder"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = ["apt_finder"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.10.4"
  spec.add_dependency "nokogiri", "~> 1.6.8"
end
