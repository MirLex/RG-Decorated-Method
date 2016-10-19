require_relative('../Classes/DecoratorsMethods.rb')

module Decorators
	module ClassMethods
		def method_added(meth)
			if @decorator 
				dec_meth , dec_mess = @decorator.first
				@decorator = nil

				orig_method = instance_method(meth)
				define_method(meth) do |*args, &blk|
					meth = orig_method.bind(self)
					DecoratorsMethods.send(dec_meth, dec_mess, meth, *args, &blk)
				end
			end
			super
		end

		def method_missing(meth, *args)
			super unless DecoratorsMethods.methods(false).include?(meth)
			@decorator = {}
			@decorator[meth] = args.size == 1 ? args.first : args
		end
	end
	
	module InstanceMethods
	end
	
	def self.included(receiver)
		receiver.extend			ClassMethods
		receiver.send :include, InstanceMethods
	end
end