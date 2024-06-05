class PosterController < ApplicationController
  before_action :authenticate_user!
end
