class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :items, class_name: OrderItem.name, dependent: :destroy

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

  module Courier
    FEDEX = {code: 1, label: "FedEx"}
    PROFESSIONAL = {code: 2, label: "Professiona Couriers"}
    BLUEDART = {code: 3, label: "Blue Dart"}
    DTDC = {code: 4, label: "DTDC"}

    def self.label(code)
      if code == FEDEX[:code]
        return FEDEX[:label]
      elsif code == PROFESSIONAL[:code]
        return PROFESSIONAL[:label]
      elsif code == BLUEDART[:code]
        return BLUEDART[:label]
      else
        return DTDC[:label]
      end
    end

    def self.all
      [FEDEX, PROFESSIONAL, BLUEDART, DTDC].collect{|hsh| OpenStruct.new(hsh)}
    end
  end
end
