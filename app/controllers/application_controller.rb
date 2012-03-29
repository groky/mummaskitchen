class ApplicationController < ActionController::Base
  protect_from_forgery
  include CustomerHelper
  include SessionHelper
end
