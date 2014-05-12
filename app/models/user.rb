class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, :presence => :true
  validates_format_of :email,:with => Devise.email_regexp
  validates :name, :presence => :true
  validates :address, :presence => :true
  validates :title, :presence => :true
  validates :degree, :presence => :true

  geocoded_by :address
  after_validation :geocode, :if => lambda{ |obj| obj.address_changed? }

  has_many :user_specialties
  has_many :specialties, :through => :user_specialties
  
end
