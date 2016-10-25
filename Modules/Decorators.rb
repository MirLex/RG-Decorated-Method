require_relative('../Classes/DecoratorsMethods.rb')

module Decorators
  module ClassMethods
    def method_added(meth)
      unless @decorators.nil?
        decorators = @decorators
        @decorators = nil
        orig_method = instance_method(meth)

        define_method(meth) do |*args, &block|
          meth = orig_method.bind(self)
          DecoratorsMethods.decorate(decorators, meth, *args, &block)
        end

      end
      super
    end

    def method_missing(meth, *args)
      super unless DecoratorsMethods.methods(false).include?(meth)
      @decorators ||= [] << { meth => args.size == 1 ? args.first : args }
    end
  end

  module InstanceMethods
    def respond_to?(meth)
      DecoratorsMethods.methods(false).include?(meth) ? true : super
    end
  end

  def self.included(receiver)
    receiver.extend ClassMethods
    receiver.send :include, InstanceMethods
  end
end
