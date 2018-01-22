class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  include SessionsHelper

  def current_level
	  return current_user.score
	end

	def sterlize(value)
  	value.chomp.downcase.gsub(/[\W\n\s]/,'')
  end

  def game_playable?
    if (Game.first and Game.first.is_playable) or current_user.admin?
    else
      redirect_to root_path, :flash => {:info => "We know YOU Love Inquest but it isn't playable yet."}
    end
  end
end
