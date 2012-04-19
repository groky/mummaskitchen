# these options are only needed if you choose smtp delivery
ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.webfaction.com',
  :port           => 25,
  :domain         => 'mummaskitchen.net',
  :authentication => :login,
  :user_name      => 'mumma_mumma',
  :password       => 'mumma211'
}