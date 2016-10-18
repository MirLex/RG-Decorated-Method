class DecoratorsMethods
	def self.add_prefix(message ,orig_method, *args, &blk)
		print message
		orig_method.call(*args, &blk)
	end

	def self.add_postfix(message ,orig_method, *args, &blk)
		orig_method.call(*args, &blk)
		" " + message
	end
end