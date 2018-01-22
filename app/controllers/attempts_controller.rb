class AttemptsController < ApplicationController

	before_filter :game_playable?, :only => [:create]

	def create
		@attempt = current_user.attempts.build(user_params)
		@attempt.level_id = current_level
		@level = Level.find(current_level)
		if @attempt.save
			puts "attempt save!"
			if sterlize(@attempt.attempt).eql? (@level.answer)
				unless current_user.admin?
					current_user.score = @level.next_id
					puts "score #{current_user.score}"
					current_user.last_correct_answer_at = Time.now
					current_user.save!
					puts "user saved"
				end

				if (current_user.score == 31)
					redirect_to current_user,
			    :flash => {:success => "Congratulations you have answered all the questions. Check Your Rank" } and return
				else
			  	redirect_to level_path(current_level), :flash => {:success => "Woahh! Congratulations! Level Cleared"} and return
				end
			else
				redirect_to level_path(current_level), :flash => {:danger => "Oops! Wrong Answer. Try Again"} and return
			end
		end
	else
		redirect_to level_path(current_level), :flash => {:warning => "Answer cannot be blank"} and return
	end

	private

    def user_params
      params.require(:attempt).permit(:attempt)
    end
end
