class CoursePresenter < BasePresenter
  presents :course

  def logo
    return course.logo if course.logo.attached?
    'default logo/logo.png'
  end
end
