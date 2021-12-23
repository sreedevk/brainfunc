module Brainfunc
  module Repl
    Run = ->() {
      puts("Brainfunc - Functional Brainfuck Interpreter")
      loop do
        print("-> ")
        case (instruction = gets.strip.chomp)
        when "quit"
          break
        when "exit"
          break
        else
          state = Brainfunc::VM::Exec.call(instruction, (state || {}))
        end
      end
      exit(0)
    }
  end
end
