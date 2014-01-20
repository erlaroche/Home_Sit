class Owner < ActiveRecord::Base

  has_many :appointments, :through => :sitters
  has_many :sitters, :through => :appointments

  def self.email_in_database(new_email)
    status = false
    all = Owner.all
    new_email = new_email["email"]
    all.each do |owner|
      if owner.email == new_email
        status = true
        return status
      end
    end
    return status
  end

end
