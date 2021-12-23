# Brainfunc
### A Functional Brainfuck Interpreter Written in Ruby

This is yet another implementation of the [Brainfuck Interpreter](https://en.wikipedia.org/wiki/Brainfuck). The style of implementation of this interpreter is mostly functional (avoids mutations, sideeffects for the most part). The core of the VM itself is written in ~39 lines of ruby (heavily golfed)

## Installation

```bash
gem install brainfunc
```
`note: you may have to reshim if you use rbenv / asdf`

## Usage

### Interpreter

```
brainfunc /path/to/code.bf
```

### Rrepl (Read Eval Print Loop)
```bash
  ibrainfunc
```

## Roadmap

1. Improve Performance
2. Improve Docs + Code Readability
3. Add a Repl

## Benchmark

program:
```brainfuck
++++++++[>++++[>++>+++>+++>+<<<<-]>+>+>->>+[<]<-]>>.>---.+++++++..+++.>>.<-.<.+++.------.--------.>>+.>++.
```
results:
```
Benchmark 1: bin/brainfunc sources/hello.bf
  Time (mean ± σ):      36.8 ms ±   0.6 ms    [User: 32.5 ms, System: 4.4 ms]
  Range (min … max):    35.7 ms …  39.1 ms    75 runs
```

