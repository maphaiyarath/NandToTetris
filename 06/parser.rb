class Parser
	def initialize(assembly_instructions)
		@assembly_instructions = assembly_instructions
		@machine_instructions = []
	end

	def parse
		@machine_instructions
	end

end