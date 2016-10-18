require_relative('Modules/Decorators.rb')

class C
	include Decorators

	add_prefix("Hello ")
	def methodA
		'from a'
	end

	def methodB
		'from b'
	end  

	add_postfix("Bay.")
	def methodC
		print 'from c'
	end
end

puts C.new.methodA # 'hello from a'
puts C.new.methodB # 'from b'
puts C.new.methodC # 'from c Bay.'

