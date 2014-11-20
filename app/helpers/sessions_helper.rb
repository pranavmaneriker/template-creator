module SessionsHelper
	def sign_in(user)
		cookies.permanent[:remember_token] = user.remember_token
		#equivalently
		#cookies[:remember_token] = { value: user.remember token,
		#							 expires: 20.years.from now.utc }
		#for only session, do session[:remember_token]
		#and use User.find(session[:remember_token])
		self.current_user = user
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		@current_user ||= User.find_by_remember_token(cookies[:remember_token])
	end

	def current_user?(user)
		user == current_user
	end

	def signed_in?
		!current_user.nil?
	end

	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
	end

	def store_location
		session[:return_to] = request.fullpath
	end

	def redirect_back_or(default)
		redirect_to(session[:return_to]||default)
		session[:return_to] = nil
	end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_path, notice: 'Please sign in to view the page'
      end
    end

end
