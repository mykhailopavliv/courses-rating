class CoursePresenter < BasePresenter
  def logo
    return model.logo if model.logo.attached?
    'default logo/logo.png'
  end
end
