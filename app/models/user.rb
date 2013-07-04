class User < ActiveRecord::Base

  before_save :setup_role
  
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :confirmable, :lockable, :omniauthable, :omniauth_providers => [:facebook, :google_oauth2, :twitter]

  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :provider, :uid, :name, :role_ids

  has_many :venues
  has_many :reviews
  has_and_belongs_to_many :roles

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
  	user = User.where(:email => access_token.info.email).first
  	unless user
  		user = User.create(
  			provider:access_token.provider,
  			uid:access_token.uid,
        name:access_token.extra.raw_info.name,
        email:access_token.info.email,
        password:Devise.friendly_token[0,20]
        )
  	end
  	user
  end

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    # JeventzLogger.debug "#{access_token.inspect}"
    # JeventzLogger.debug "#{signed_in_resource.inspect}"

    user = User.where(:email => access_token.info.email).first

    unless user
      user = User.create(
        provider:access_token.provider,
        uid:access_token.uid,
        name: access_token.info.name,
        email: access_token.info.email,
        password: Devise.friendly_token[0,20]
        )
    end

    user
  end

  def self.new_with_session(params, session)
  	super.tap do |user|
  		if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
  			user.email = data["email"] if user.email.blank?
  		end
  	end
  end

  def role?(role)
      return !!self.roles.find_by_name(role.to_s.camelize)
  end

  # Default role is "Registered"
  def setup_role 
    if self.role_ids.empty?     
      self.role_ids = Role.where(name: 'Customer').first.id
    end
  end

end
