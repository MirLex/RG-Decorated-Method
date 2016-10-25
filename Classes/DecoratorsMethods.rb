class DecoratorsMethods
  def self._add_prefix(message)
    print message
  end

  def self.add_postfix(message)
    print ' ' + message
  end

  def self.decorate(decorators, meth, *args, &block)
    decorators.select { |dec| dec.keys.first =~ /\A[:_]/ }
              .each do |dec|
      send(dec.keys.first, dec.values.first)
    end

    meth.call(*args, &block)

    decorators.select { |dec| dec.keys.first !~ /\A[:_]/ }
              .each do |dec|
      send(dec.keys.first, dec.values.first)
    end

    nil
  end
end
