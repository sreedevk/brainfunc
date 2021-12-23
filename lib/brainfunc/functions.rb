# frozen_string_literal: true

module Brainfunc
  Functions = (Hash.new { ->(state) { state.merge({inst_p: state[:inst_p] + 1}) } })
    .merge(
      {
        ?> => ->(state) { state.merge({data_p: state[:data_p]+1, inst_p: state[:inst_p] + 1}) },
        ?< => ->(state) { state.merge({data_p: state[:data_p]-1, inst_p: state[:inst_p] + 1}) },
        ?+ => ->(state) { state.merge({memory: state[:memory].merge(state[:data_p] => (state[:memory][state[:data_p]]+1 % 127).abs), inst_p: state[:inst_p] + 1}) },
        ?- => ->(state) { state.merge({memory: state[:memory].merge(state[:data_p] => (state[:memory][state[:data_p]]-1 % 127).abs), inst_p: state[:inst_p] + 1}) },
        ?. => ->(state) { print(state[:memory][state[:data_p]].chr); state.merge({inst_p: state[:inst_p] + 1}) },
        ?, => ->(state) { state.merge({memory: state[:memory].merge({ state[:data_p] => STDIN.getch.bytes[0] }), inst_p: state[:inst_p] + 1}) },
        ?[ => ->(state) { 
          state[:stack].push(state[:inst_p]) && ((
            state[:memory][state[:data_p]].zero? && state.merge(
              inst_p: state[:program]
              .slice(state[:inst_p]..-1)
              .filter_map.with_index { |el, index| index + 1 if el == "]" }[state[:stack].size]
            )
          ) || state.merge({inst_p: state[:inst_p] + 1}))
        },
        ?] => ->(state) {
          (matching_paren=state[:stack].pop) && ((
            !state[:memory][state[:data_p]].zero? && 
            state.merge({inst_p: matching_paren})
          ) || state.merge({inst_p: state[:inst_p] + 1}))
        },
        ?# => ->(state) { puts(state.inspect) || state.merge({inst_p: state[:inst_p] + 1}) }
      }
    )
end
