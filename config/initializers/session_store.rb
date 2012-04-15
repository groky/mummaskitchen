# Be sure to restart your server when you modify this file.

# Mummaskitchen::Application.config.session_store :cookie_store, :key => '_mummaskitchen_session'
# Mummaskitchen::Application.config.action_controller.session = { 
#    :session_key => '_mummas_kitchen', 
#    :secret      => 'this_basically only keeps_the-menu+what!people are ordering' 
#  }

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
 Mummaskitchen::Application.config.session_store :active_record_store
