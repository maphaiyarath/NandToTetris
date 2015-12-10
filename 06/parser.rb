class Parser

	require_relative 'code'

	def initialize(assembly_instructions)
		@assembly_instructions = assembly_instructions
		@machine_instructions = []
		@code = Code.new()
	end

	def parse
		@assembly_instructions.each do |instruction|
			if command_type(instruction) == :a_command
				@machine_instructions << assemble_a_command(instruction)
			elsif command_type(instruction) == :c_command
				@machine_instructions << assemble_c_command(instruction)
			end
		end
		@machine_instructions
	end

	def assemble_a_command(instruction)
		command = "0"
		command << constant(instruction[1..-1])
	end

	def constant(value)
		"%015b" % value
	end

	def assemble_c_command(instruction)
		# c-instruction is an assignment or a jump
		# always starts with '111'
		command = "111"
		# if it's an assignment, it'll have '='
		if instruction.include? '='
			# append comp (2nd element in array), dest (1st element) & no jump (000)
			@bits = instruction.split('=')
			command << @code.comp(@bits[1])
			command << @code.dest(@bits[0])
			command << '000'
		# or it's a jump, in which case, it'll include a ';'
		else instruction.include? ';'
			@bits = instruction.split(';')
			command << @code.comp(@bits[0])
			command << '000'
			command << @code.jump(@bits[1])
			# need to figure out labels now...
		end
	end

	def command_type(instruction)
		if instruction.start_with?("@")
			:a_command
		else
			:c_command
		end
	end
end