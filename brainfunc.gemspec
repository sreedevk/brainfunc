Gem::Specification.new do |s|
  s.name                  = "brainfunc"
  s.version               = '0.0.1'
  s.licenses              = ['MIT']
  s.summary               = 'Tiny, Performant Brainfuck interpreter implemented in the functional paradigm.'
  s.description           = "Tiny, Performant, Functional Brainfuck interpreter"
  s.authors               = ['Sreedev Kodichath']
  s.email                 = 'sreedevpadmakumar@gmail.com'
  s.files                 = [
    "bin/brainfunc",
    "lib/brainfunc.rb",
    "lib/brainfunc/vm.rb"
  ]
  s.homepage              = "https://www.sree.dev"
  s.metadata              = { 'source_code_uri' => "https://github.com/sreedevk/brainfunc" }
  s.bindir                = 'bin'
  s.required_ruby_version = '~> 3.0.0'
  s.executables   << 'brainfunc'
end
