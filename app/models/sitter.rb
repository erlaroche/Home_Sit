class Sitter < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :lockable and 
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :owners, :through => :appointments
  has_many :appointments, :through => :owners

  mount_uploader :attachment, AvatarUploader 

  def self.from_omniauth(auth, code)
    where(auth.slice(:provider, :uid)).first_or_create do |sitter|
      sitter.provider = auth.provider
      sitter.uid = auth.uid
      sitter.name = auth.info.name
      sitter.email = auth.info.email
      sitter.auth_code = code
    end
  end

  def self.new_with_session(params, session)
    if session["devise.sitter_attributes"]
      new(session["devise.sitter_attributes"], without_protection: true) do |sitter|
        sitter.attributes = params
        sitter.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end


end
