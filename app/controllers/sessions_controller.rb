# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def new; end

  def destroy; end
end
