# Brainfunc
### A Functional Brainfuck Interpreter Written in Ruby

This is yet another implementation of the [Brainfuck Interpreter](https://en.wikipedia.org/wiki/Brainfuck). The style of implementation of this interpreter is mostly functional (avoids mutations, sideeffects for the most part). The core of the VM itself is written in ~39 lines (excluding repl support functions) of ruby (heavily golfed)

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

### Repl (Read Eval Print Loop)
```bash
  ibrainfunc
```
![2021-12-23-115421_2006x1728_scrot](https://user-images.githubusercontent.com/36154121/147197758-1da59864-7860-4e03-8bc1-47f0fec4190f.png)

The Repl maintains state across commands. you can either enter a single instruction / a string of instructions.
Invalid instructions are added to the program memory, but are never evaluated.

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

