  require 'rubygems'
  require 'date'
  require 'time'

class CreditCard

  attr_reader :cardNumber, :year, :month

  def initialize(cardNumber, year, month)
      @cardNumber, @year, @month = cardNumber, year, month
  end

  def is_amex
    return @cardNumber.to_s.match("^3[4 7][0-9]{13}$")
  end

  def is_diner
    return @cardNumber.to_s.match("^30[0-5][0-9]{11}$")
  end

  def is_discover
    return @cardNumber.to_s.match("^6(?:011|5[0-9]{2})[0-9]{12}$")
  end

  def is_mastercard
    return @cardNumber.to_s.match("^5[1-5][0-9]{14}$")
  end
  
  def is_visa
    return @cardNumber.to_s.match("^4[0-9]{12}(?:[0-9]{3})?$")
  end

  def has_valid_date
    if (@year>Date.today.year || (@year==Date.today.year and @month>=Date.today.month))
      return true
    else
      return false
    end
  end

  def valid?
    if ((is_visa || is_mastercard || is_discover || is_diner || is_amex) && has_valid_date)
      return true
    else
      return false
    end
  end

  def type
    if valid? 
      if is_visa
        return Type.new("VISA")
      elsif is_mastercard
        return Type.new("MC")
      elsif is_discover
        return Type.new("DISC")
      elsif is_diner
        return Type.new("DCCB")
      elsif is_amex
        return Type.new("AMEX")
      else
      end
    end
  end
end

class Type 

 attr_reader :name

  def initialize(name)
      @name = name
  end
end 