# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "jekyll-embeds"
  spec.version       = "0.0.6"
  spec.authors       = ["SEBAS204"]

  spec.summary       = %q{Jekyll plugin for embedding diferent media elements.}
  spec.description   = %q{Jekyll plugin to generate html snippets for embedding Youtube; VIMEO; Twitch channels, videos & clips; SoundCloud.}
  spec.homepage      = "https://github.com/ZEBAS204/Jekyll-Embeds"
  spec.license       = "MIT"

  spec.files         = ["Gemfile","jekyll-embeds.gemspec","Rakefile","LICENSE","lib/jekyll-embeds.rb"]
  spec.require_paths = ["lib"]

  spec.metadata    = { "documentation_uri" => "https://github.com/ZEBAS204/Jekyll-Embeds/blob/master/README.md#usage" }

  spec.add_dependency 'jekyll'
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end