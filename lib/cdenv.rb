require 'cdenv/path'

module CDENV

  def self.find_method(name)
    CDENV.constants.collect{|k| CDENV.const_get(k)}.select {|k| k.is_a?(Class)}.each do |k|
      if(k.respond_to?(name)) then
        return k.method(name)
      end
    end
    return nil
  end

end
