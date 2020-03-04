# Q1.
# 次の動作をする A1 class を実装する
# - "//" を返す "//"メソッドが存在すること
class A1
  define_method '//' do
    '//'
  end
end

# Q2.
# 次の動作をする A2 class を実装する
# - 1. "Medpeer Dev Team"と返すdev_teamメソッドが存在すること
# - 2. initializeに渡した配列に含まれる値に対して、"hoge_" をprefixを付与したメソッドが存在すること
# - 2で定義するメソッドは下記とする
#   - 受け取った引数の回数分、メソッド名を繰り返した文字列を返すこと
#   - 引数がnilの場合は、dev_teamメソッドを呼ぶこと
class A2
  def initialize(values)
    values.each { |v| A2.define_hoge_method(v) }
  end

  def dev_team
    'Medpeer Dev Team'
  end

  def self.define_hoge_method(name)
    define_method "hoge_#{name}" do |arg = nil|
      arg ? __method__.to_s * arg : dev_team
    end
  end
end

# Q3.
# 次の動作をする OriginalAccessor モジュール を実装する
# - OriginalAccessorモジュールはincludeされたときのみ、my_attr_accessorメソッドを定義すること
# - my_attr_accessorはgetter/setterに加えて、boolean値を代入した際のみ真偽値判定を行うaccessorと同名の?メソッドができること
module OriginalAccessor
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def my_attr_accessor(attr)
      define_method "#{attr}" do
        instance_variable_get "@#{attr}"
      end

      define_method "#{attr}=" do |value|
        instance_variable_set("@#{attr}", value)


        if value.is_a?(FalseClass) || value.is_a?(TrueClass)
          # なんで動いたかわかっていません
          self.singleton_class.instance_eval do
            define_method "#{attr}?" do
              instance_variable_get "@#{attr}"
            end
          end
          # 作戦2
          # self.class.send(:define_method, "#{attr}?") { instance_variable_get "@#{attr}" }

          # 作戦1
          # define_method "#{attr}?" do
          #   instance_variable_get "@#{attr}"
          # end
        end
      end
    end
  end
end
