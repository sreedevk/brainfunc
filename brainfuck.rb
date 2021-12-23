# frozen_string:literal: true

module Brainfuck
  class VM
    def ops
      @ops ||= {
        ">" => ->(state) { state.merge({data_p: state[:data_p]+1, inst_p: state[:inst_p] + 1}) },
        "<" => ->(state) { state.merge({data_p: state[:data_p]-1, inst_p: state[:inst_p] + 1}) },
        "+" => ->(state) { state.merge({memory: state[:memory].merge(state[:data_p] => (state[:memory][state[:data_p]]+1 % 127).abs), inst_p: state[:inst_p] + 1}) },
        "-" => ->(state) { state.merge({memory: state[:memory].merge(state[:data_p] => (state[:memory][state[:data_p]]-1 % 127).abs), inst_p: state[:inst_p] + 1}) },
        "." => ->(state) { print(state[:memory][state[:data_p]].chr); state.merge({inst_p: state[:inst_p] + 1}) },
        "," => ->(state) { state.merge({memory: state[:memory].merge({ state[:data_p] => STDIN.getch.bytes[0] }), inst_p: state[:inst_p] + 1}) },
        "[" => ->(state) { 
          state[:stack].push(state[:inst_p]) && ((
            state[:memory][state[:data_p]].zero? && state.merge(
              inst_p: state[:program]
              .slice(state[:inst_p]..-1)
              .filter_map
              .with_index { |el, index| index + 1 if el == "]" }[state[:stack].size]
            )
          ) || state.merge({inst_p: state[:inst_p] + 1}))
        },
        "]" => ->(state) {
          (matching_paren=state[:stack].pop) && ((
            !state[:memory][state[:data_p]].zero? && 
            state.merge({inst_p: matching_paren})
          ) || state.merge({inst_p: state[:inst_p] + 1}))
        }
      }
    end

    def exec(source)
      machine = {
        memory: Hash.new { 0 },
        inst_p: 0,
        data_p: 0,
        stack: [],
        program: source.strip.chars
      }

      loop { (machine = ops[machine[:program][machine[:inst_p]]].(machine)) && (machine[:inst_p] >= machine[:program].length && break) }
      machine
    end

    def debug(machine)
      { m: machine.slice(:memory, :data_p, :inst_p), in: machine[:program][machine[:inst_p]] }
    end
  end
end

Brainfuck::VM.new.exec(ARGF.read)
