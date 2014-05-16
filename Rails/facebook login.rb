# gems
gem 'omniauth'
gem 'omniauth-facebook'
gem 'oauth2'
gem "koala"
gem 'fb_graph'


# migration
class AddProviderToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
  end
end

# app/controllers/omniauth_callbacks_controller.rb
class OmniauthCallbacksController < Devise::OmniauthCallbacksController   
  def facebook     
     @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)      
     if @user.persisted?       
      #this will throw if @user is not activated
      sign_in_and_redirect @user, :event => :authentication 
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
# app/config/intializers.devise.rb
  require "omniauth-facebook"
    config.omniauth :facebook, ENV['FB_APP_ID'], ENV['FB_APP_SECRET'], {
    strategy_class: OmniAuth::Strategies::Facebook,
    provider_ignores_state: true,
  }
  
# app/models/user.rb

devise :omniauthable, :omniauth_providers => [:facebook]

def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
  user = User.where( provider: auth.provider, uid: auth.uid).first
  if !user
    registered_user = User.where( email: auth.info.email).first
    if registered_user
      user = registered_user
    else
      user = User.create(username:auth.extra.raw_info.name,
                          provider:auth.provider,
                          uid:auth.uid,
                          email:auth.info.email,
                          password:Devise.friendly_token[0,20],
                        )
    end    
  end
  # uncomment for add facebook friends
  # add_fb_friends(user, auth);
  user
end

# if you want to check for facebook friends 
# here is used the weatherforecast friendship model
# it may need some changes

def self.add_fb_friends(user,auth)

koala = Koala::Facebook::API.new(auth.credentials.token,ENV['FB_APP_KEY'])
fb_friend = koala.get_connections('me','friends')
fb_ids = fb_friend.map { |obj| obj['id'] }
friends = User.where( uid: fb_ids)
if friends.length > 0
  friends.each do |friend|
    if !user.friends.include? friend
      # modify according to the app friendship model
      friendship = user.friendships.build( friend_id: friend.id)
      inverse_friendship = user.inverse_friendships.build( user_id: friend.id )
      friendship.accepted
      inverse_friendship.accepted
      friendship.save
      inverse_friendship.save
    end
  end
end

def self.add_friend(friend)

