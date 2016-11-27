require_relative('../../Modules/Decorators')

RSpec.describe Decorators do
  subject(:obj) { C.new }
  before(:all) do
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
  end
  context 'call methods' do
    it 'call method without decorators' do
      expect { obj.method_b }.to output('from b').to_stdout
    end
    it 'call method with single decorator' do
      expect { obj.method_c }.to output('from c Bay.').to_stdout
    end
    it 'call method with multiple decorators' do
      expect { obj.method_a }.to output('Hello from a !').to_stdout
    end
  end

  context 'instance respond to decorators methods' do
    it 'respond to _add_prefix, add_postfix methods' do
      expect(obj).to respond_to(:_add_prefix, :add_postfix)    
    end
  end
end