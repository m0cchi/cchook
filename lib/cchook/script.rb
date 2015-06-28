require_relative 'array.rb'
class Script
  using StringArray

  def initialize(name,target)
    @pre = []
    @post = []
    @name = name
    @target = target
  end
  
  def add_pre(script)
    @pre << script
  end

  def add_post(script)
    @post << script
  end

  def Script.instance(name,target)
    Script.new(name,target)
  end

  def Script.add_prefix(array)
    array.map{|str| str = 'source ' << str}
  end
  
  def to_s
    <<-EOS
function #{@name}(){
  #{Script.add_prefix(@pre).to_s}
  #{@target}
  #{Script.add_prefix(@post).to_s}
}
EOS
  end
end
