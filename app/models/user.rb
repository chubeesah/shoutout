class Users < ActiveRecord::Base
  has_many :shouts
end
