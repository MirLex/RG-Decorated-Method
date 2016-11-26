require_relative('../../Modules/Decorators')

RSpec.describe Decorators do
  subject(:obj) { C.new }
  before(:all) do
    class C
      include Decorators

      _add_prefix('Hello ')
      add_postfix('!')
      def method_a
        'from a'
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
  context 'call method' do
     it 'call method_a' do
      res =  obj.method_a
      expect(res).to eq('111')
     end   
  end
end
