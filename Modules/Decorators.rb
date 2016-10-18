module Decorators
	module ClassMethods
		def method_added(name)
		  	puts "ADD Method #{name}"
		 end
		 
		 def method_missing(method, *args, &block)
		    puts "not existing method #{method} was called"
		    puts "Args #{args}"
		    puts "Block #{block}" if block_given?
		 end
	end
	
	module InstanceMethods
	end
	
	def self.included(receiver)
		receiver.extend         ClassMethods
		receiver.send :include, InstanceMethods
	end
end