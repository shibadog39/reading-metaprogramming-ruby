module MyModule
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def define_my_method
      define_method(:my_method) do |value|
        @hoge = value
      end
    end
  end
end

class Hoge
  include MyModule
end
