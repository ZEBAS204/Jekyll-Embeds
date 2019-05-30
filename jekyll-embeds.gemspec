# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name          = "jekyll-embeds"
  s.version       = "0.0.2"
  s.authors       = ["SEBAS204"]

  s.summary       = %q{jekyll plugin to generate html snippets for embedding Youtube videos, twitch, etc}
  s.description   = %q{jekyll plugin to generate html snippets for embedding Youtube videos, twitch, etc}
  s.homepage      = "https://github.com/ZEBAS204/Jekyll-Embeds"
  s.license       = "MIT"

  s.files         = ["jekyll-embeds.rb"]

  s.metadata    = { "documentation_uri" => "https://github.com/ZEBAS204/Jekyll-Embeds/blob/master/README.md#usage" }

  s.add_dependency 'jekyll'
  s.add_development_dependency "bundler", "~> 1.10"
  s.add_development_dependency "rake", "~> 10.0"
end
