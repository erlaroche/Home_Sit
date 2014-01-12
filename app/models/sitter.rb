class Sitter < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  has_many :owners, :through => :appointments
  has_many :appointments, :through => :owners

  mount_uploader :attachment, AvatarUploader 
end
