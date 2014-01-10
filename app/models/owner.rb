class Owner < ActiveRecord::Base

  has_many :appointments, :through => :sitters
  has_many :sitters, :through => :appointments
end
