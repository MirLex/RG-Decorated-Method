require_relative('Modules/Decorators.rb')

class C
  include Decorators

  add_prefix('hello ')
  def methodA
    'from a'
  end

  def methodB
    'from b'
  end

end

puts C.new.methodA # 'hello from a'
puts C.new.methodB # 'from b'