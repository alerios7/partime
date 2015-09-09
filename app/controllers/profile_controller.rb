class ProfileController < ApplicationController
  before_action :authenticate_worker!
  def show
    @worker = current_worker
  end

end
