module Brainfunc
  class Repl
    attr_accessor :vm, :state

    def initialize
      @machine = Brainfunc::VM.new
      @state   = @machine.exec(String.new)
      puts("Brainfunc - Functional Brainfuck Interpreter")
    end

    def run
      loop do
        print("-> ")
        case (instruction=gets.strip.chomp)
        when "quit"
          exit(0)
        else
          @state = @machine.run(@state.merge(program: @state[:program] + [instruction]))
          pp @state
        end
      end
    end
  end
end
