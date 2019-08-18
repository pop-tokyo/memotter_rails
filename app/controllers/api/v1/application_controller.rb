class Api::V1::ApplicationController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken
  include DeviseTokenAuth::Concerns::User
end
