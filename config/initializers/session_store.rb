# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_mugasha-twitter_session',
  :secret      => '223e62703217a184ac0652fb120111889e444259d218aa8ba21be028a9f91e0b3385dfe818a2c6912cfab28c3d95b2fadfc7836bc9cdf3eb0c18014edba0030c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
