#! /usr/bin/env ruby

# function
def args_valid?()
  ARGV[0] && ARGV[0].end_with?(".asm") && ARGV.length == 1
end

def is_readable?(path)
  File.readable?(path)
end

unless args_valid?
  abort ("Usage: ./assembler.rb Prog.asm")
end

asm_filename = ARGV[0]

unless is_readable?(asm_filename)
  abort("#{asm_filename} not found or is unreadable.")
end

puts "The contents of #{asm_filename}"

# puts "Hey, what's for lunch?"
# answer = gets.chomp
# p name
# puts "Oh, #{answer}, sounds good!"







