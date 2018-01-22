module SessionsHelper
	
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Returns true if the given user is the current user.
  def current_user?(user)
    user == current_user
  end

  def find_rank
    ahead = User.where(["score > ?", current_user.score]).count
    rank = ahead + User.where(["score = :s and last_correct_answer_at < :t",{s: current_user.score, t: current_user.last_correct_answer_at}]).count
    return rank + 1
  end
  
  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
