class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  module Status
    PROCESSING = {code: 1, label: "Processing"}
    PACKED = {code: 2, label: "Packed"}
    PICKED = {code: 3, label: "Picked"}
    DELIVERED= {code: 4, label: "Delivered"}

    def self.label(code)
      if code == PROCESSING[:code]
        return PROCESSING[:label]
      elsif code == PACKED[:code]
        return PACKED[:label]
      elsif code == PICKED[:code]
        return PICKED[:label]
      else
        return DELIVERED[:label]
      end
    end

    def self.all
      [PROCESSING, PACKED, PICKED, DELIVERED].collect{|hsh| OpenStruct.new(hsh)}
    end
  end
end
