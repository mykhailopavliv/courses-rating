module ApplicationHelper
  include Pagy::Frontend

  def present(model, presenter_class = nil)
    return if model.blank?

    klass     = presenter_class || "#{model.class}Presenter".constantize
    presenter = klass.new(model, self)

    yield(presenter) if block_given?
  end

  def rates_count(course)
    course.rates('rating').count
  end

  def blank_stars(course)
    5 - course.average('rating')&.avg.to_i
  end

  def filled_stars(course)
    course.average('rating')&.avg.to_i
  end

  def average_rating(course)
    course.average('rating')&.avg
  end

  def reviews_count(course)
    rates_count(course) if rates_count(course) >= 1
  end
end
