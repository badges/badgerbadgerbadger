Before '@gemspec' do
  fakespec = <<EOF
  # coding: utf-8
  lib = File.expand_path('../lib', __FILE__)
  $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

  Gem::Specification.new do |spec|
    spec.name          = 'suchgem'
    spec.license       = 'MIT'
  end
EOF

  f = File.open "#{$temp_repo}/suchgem.gemspec", 'w'
  f.write fakespec
  f.close
end

Before '@gemspecmultilicense' do
  fakespec = <<EOF
  # coding: utf-8
  lib = File.expand_path('../lib', __FILE__)
  $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

  Gem::Specification.new do |spec|
    spec.name          = 'suchgem'
    spec.licenses       = ['MIT', 'apache']
  end
EOF

  f = File.open "#{$temp_repo}/suchgem.gemspec", 'w'
  f.write fakespec
  f.close
end