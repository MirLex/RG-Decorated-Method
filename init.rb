require_relative('Modules/Decorators.rb')

class C
  include Decorators

  _add_prefix('Hello ')
  add_postfix('!')
  def method_a
    print 'from a'
  end

  def method_b
    print 'from b'
  end

  add_postfix('Bay.')
  def method_c
    print 'from c'
  end
end

puts C.new.method_a # 'Hello from a !'
puts C.new.method_b # 'from b'
puts C.new.method_c # 'from c Bay.'

p C.new.respond_to?(:method_a)
p C.new.respond_to?(:_add_prefix)
p C.new.respond_to?(:add_prefix)
