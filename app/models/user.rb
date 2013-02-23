class User < ActiveRecord::Base

  devise :omniauthable, :token_authenticatable,
         :rememberable, :trackable,
         :omniauth_providers => [ :google_oauth2 ]

  def self.find_for_google_oauth2 access_token, signed_in_resource = nil
    data = access_token.info
    User.where(email: data['email']).first_or_create name: data['name']
  end

end
