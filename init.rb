require_relative('Modules/Decorators.rb')

class C
  include Decorators

  _add_prefix("Hello ")
  add_postfix("!")
  def methodA
    print 'from a'
  end

  def methodB
    print 'from b'
  end  

  add_postfix("Bay.")
  def methodC
    print 'from c'
  end
end

puts C.new.methodA # 'Hello from a !'
puts C.new.methodB # 'from b'
puts C.new.methodC # 'from c Bay.'

p C.new.respond_to?(:methodA)
p C.new.respond_to?(:_add_prefix)
p C.new.respond_to?(:add_prefix)

