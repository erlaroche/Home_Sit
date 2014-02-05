class Owner < ActiveRecord::Base

  has_many :appointments, :through => :sitters
  has_many :sitters, :through => :appointments

  validates_presence_of :email
  
  def self.email_in_database(new_email)
    status = false
    all = Owner.all
    all.each do |owner|
      if owner.email == new_email
        status = true
        return status
      end
    end
    return status
  end

  def self.register(params)
    @owner_email = params["owner"]["email"]
    if Owner.email_in_database(@owner_email)
      @owner = Owner.find_by(:email => "#{@owner_email}")
      # return my_action
    else
      @owner = Owner.new(params["owner"])
      @owner.save
    end
    return @owner
  end

end
