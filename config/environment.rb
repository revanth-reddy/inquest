# Load the Rails application.
require File.expand_path('../application', __FILE__)
require 'carrierwave/orm/activerecord'
# Initialize the Rails application.
Rails.application.initialize!

ENV['RECAPTCHA_SITE_KEY']  = '6LfXyBMUAAAAABLJYLbdmL7H_4yPwIYw996SRyGn'
ENV['RECAPTCHA_SECRET_KEY'] = '6LfXyBMUAAAAACtVCAsqmRMq3JvwoTnZR1A8DyMB'
