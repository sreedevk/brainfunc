Gem::Specification.new do |s|
  s.name                  = "brainfunc"
  s.version               = '0.0.5'
  s.licenses              = ['MIT']
  s.summary               = 'Tiny, Performant Brainfuck interpreter implemented in the functional paradigm.'
  s.description           = "Tiny, Performant, Functional Brainfuck interpreter"
  s.authors               = ['Sreedev Kodichath']
  s.email                 = 'sreedevpadmakumar@gmail.com'
  s.files                 = [
    "bin/brainfunc",
    "bin/ibrainfunc",
    "lib/brainfunc.rb",
    "lib/brainfunc/vm.rb",
    "lib/brainfunc/repl.rb",
    "lib/brainfunc/functions.rb"
  ]
  s.homepage              = "https://www.sree.dev"
  s.metadata              = { 'source_code_uri' => "https://github.com/sreedevk/brainfunc" }
  s.bindir                = 'bin'
  s.required_ruby_version = '~> 3.0.0'
  s.executables          += ['ibrainfunc', 'brainfunc']
end
