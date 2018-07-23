module ControllerHelpers
  def sign_in(user = double('user'), scope = :user)
    current_user = "current_#{scope}".to_sym
    if user.nil?
      sign_in_visitor current_user
    else
      sign_in_user current_user
    end
  end

  def sign_in_visitor(current_user)
    allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, scope: scope)
    allow(controller).to receive(current_user).and_return(nil)
  end

  def sign_in_user(current_user)
    allow(request.env['warden']).to receive(:authenticate!).and_return(user)
    allow(controller).to receive(current_user).and_return(user)
  end
end
