class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  phony_normalize :phone, :default_country_code => 'US'

  validates :email, :presence => :true, :uniqueness => true
  validates_format_of :email,:with => Devise.email_regexp
  validates :name, :presence => :true
  validates :address, :presence => :true
  validates :title, :presence => :true
  validates :degree, :presence => :true


  geocoded_by :address

  after_validation :normalize_address, :if => lambda{ |obj| obj.address_changed? }
  after_validation :geocode, :if => lambda{ |obj| obj.address_changed? }

  has_many :user_specialties
  has_many :specialties, :through => :user_specialties

  def specialty_names=(names)
    user_specialties.destroy_all
    names.each do |name|
      specialty = Specialty.find_by(:name=>name)
      if specialty
        specialties << specialty
      end
    end
  end

protected
  def normalize_address
    results = Geocoder.search(self.address)
    if result = results[0]
      self.address = result.data["formatted_address"]
    end
  end
  
end
