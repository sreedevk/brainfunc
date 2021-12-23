# frozen_string_literal: true

module Brainfunc
  require_relative "functions"

  module VM
    Exec = ->(source, vm_state = {}) {
      vm_state = { memory: Hash.new { 0 }, inst_p: 0, data_p: 0, stack: [], program: (vm_state[:program] || []) + source.strip.chars }
      loop { (vm_state=Brainfunc::Functions[vm_state[:program][vm_state[:inst_p]]].(vm_state)) && (vm_state[:inst_p] >= vm_state[:program].length && break) }
      vm_state
    }

    Debug = ->(machine) {
      { m: machine.slice(:memory, :data_p, :inst_p), in: machine[:program][machine[:inst_p]], stack: machine[:stack] }
    }
  end
end
