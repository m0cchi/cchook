module StringArray
  refine Array do
    def to_s
      str = ''
      self.each do |elem|
        str << elem
        str << "\n"
      end
      str
    end
  end
end
