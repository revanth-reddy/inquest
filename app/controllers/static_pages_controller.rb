class StaticPagesController < ApplicationController
  def home
    @total_user = User.count
    if current_user
      redirect_to current_user
    else 
    end
  end

  def help
  end

  def about
  end

  def contact
  end

  def admin
 		@level = Level.new
 		@users = User.all
 	end

	def edit_level
	  @level = Level.find(params[:id])
	end
end
