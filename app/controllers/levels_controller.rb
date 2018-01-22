class LevelsController < ApplicationController

	before_filter :admin_user, :only => [:create, :edit, :update, :destroy]
	before_filter :registered_user, :only => [:show]
	before_filter :game_playable?, :only => [:show, :play]

	def show
		@level = Level.find(params[:id])
	  @attempt = current_user.attempts.build if logged_in?
	  @attempts = Attempt.where(:user_id => current_user.id , :level_id => @level.id)
	  redirect_to @level if params[:redirect_to_correct_location]
	end

	def play
	  redirect_to level_path(current_user.score)
	end

	def create
	  @level = Level.set(params[:level])
	  @level_last = Level.last

	  if @level.save
	    @level_last.update_attributes(:next_id => Level.last.id ) if @level_last
	    flash[:success] = "Level Created"
	    redirect_to @level
	  end
	end

	# def update 
 #    @level = Level.find(params[:id])
 #    if @level.update_attributes(params[:level])
 #    	flash[:success] = "Level successfully Updated"
 #    	redirect_to @level
 #    else
 #    	render 'extra_pages/edit_level'
 #   end
  #end

	private
	  def admin_user
	    redirect_to root_path, notice: "Restricted area! Only admins permitted." unless current_user and current_user.admin?
	  end

	  def registered_user
	    redirect_to root_path, notice: "Register or Sign in to play." unless current_user
	    if current_user
	    	if params[:id].to_i != current_user.score and current_user.score == 5
	    		redirect_to current_user
	    	else
		      params[:redirect_to_correct_location] = true if params[:id].to_i != current_user.score
		      params[:id] = current_user.score
	    	end
	    end
  	end
  	
end
