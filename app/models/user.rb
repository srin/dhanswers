class User < ActiveRecord::Base
	acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]

  has_many :posts
  has_many :comments

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def increase_karma(count=1)
    update_attribute(:karma, karma + count)
  end

  def decrease_karma(count=1)
  	update_attribute(:karma, karma - count)
  end

  def largeimage
	"http://graph.facebook.com/#{self.uid}/picture?type=large"
	end

	def normalimage
	"http://graph.facebook.com/#{self.uid}/picture?type=normal"
	end
	
  def smallimage
	"http://graph.facebook.com/#{self.uid}/picture?type=small"
	end

  def self.from_omniauth(auth)
	  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	    user.email = auth.info.email
	    user.password = Devise.friendly_token[0,20]
	    user.name = auth.info.name   # assuming the user model has a name
	  	user.image_file_name  = auth.info.image # assuming the user model has an image
	  end
	end

end


