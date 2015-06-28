require_relative './array'
class Script
  using StringArray
  @pre = []
  @post = []
  def initialize(name,target)
    @name = name
    @target = target
  end
  
  def add_pre(script)
    @pre << script
  end

  def add_post(script)
    @post << script
  end

  def Script.add_prefix(array)
    array.map{|str| str = 'source ' << str}
  end
  
  def to_s
    <<-EOS
function #{@name}(){
  #{Script.add_prefix(@pre).to_s}
  #{target}
  #{Script.add_prefix(@post).to_s}
}EOS
  end
end
