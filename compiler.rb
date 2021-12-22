require 'pry'

module Brainfuck
  class Compiler
    OPS = {
      ">" => ->(state) { state.merge({data_p: state[:data_p]+1, inst_p: state[:inst_p] + 1}) },
      "<" => ->(state) { state.merge({data_p: state[:data_p]-1, inst_p: state[:inst_p] + 1}) },
      "+" => ->(state) { state.merge({memory: state[:memory].merge(state[:data_p] => (state[:memory][state[:data_p]]+1 % 127).abs), inst_p: state[:inst_p] + 1}) },
      "-" => ->(state) { state.merge({memory: state[:memory].merge(state[:data_p] => (state[:memory][state[:data_p]]-1 % 127).abs), inst_p: state[:inst_p] + 1}) },
      "." => ->(state) { print(state[:memory][state[:data_p]].chr); state.merge({inst_p: state[:inst_p] + 1}) },
      "," => ->(state) { state.merge({memory: state[:memory].merge({ state[:data_p] => STDIN.getch.bytes[0] }), inst_p: state[:inst_p] + 1}) },
      "[" => ->(state) { 
        (
          state[:memory][state[:data_p]].zero? && state.merge(
            inst_p: state[:program]
            .slice(state[:inst_p]..-1)
            .filter_map
            .with_index { |el, index| index + 1 if el == "]" }
            .min
          )
        ) || state.merge({inst_p: state[:inst_p] + 1})
      },
      "]" => ->(state) {
        (
          !state[:memory][state[:data_p]].zero? && state.merge(
            inst_p: state[:program]
            .slice(0..state[:inst_p])
            .filter_map
            .with_index { |el, index| index + 1 if el == "[" }
            .max
          )
        ) || state.merge({inst_p: state[:inst_p] + 1})
      }
    }

    def compile(source)
      machine = {
        memory: Hash.new { 0 },
        inst_p: 0,
        data_p: 0,
        program: source.strip.chars
      }

      loop do
        print("\r#{machine.slice(:memory, :data_p, :inst_p).inspect}")
        sleep 0.2
        machine = Compiler::OPS[machine[:program][machine[:inst_p]]].(machine)

        break if machine[:inst_p] >= machine[:program].length
        raise "negative data_p!" if machine[:data_p].negative?
        raise "negative inst_p!" if machine[:inst_p].negative?
      end

      state
    end
  end
end

Brainfuck::Compiler.new.compile(ARGF.read)
