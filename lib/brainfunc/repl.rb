module Brainfunc
  class Repl
    attr_accessor :vm, :state

    def initialize
      @machine = Brainfunc::VM.new
      @state   = {}
      puts("Brainfunc - Functional Brainfuck Interpreter")
    end

    def run
      loop do
        print("-> ")
        case (instruction=gets.strip.chomp)
        when "quit"
          exit(0)
        when "exit"
          exit(0)
        else
          @state = @machine.exec(instruction, @state)
        end
      end
    end
  end
end
