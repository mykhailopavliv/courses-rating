module ApplicationHelper
  include Pagy::Frontend

  def present(model, presenter_class = nil)
    return if model.blank?

    klass     = presenter_class || "#{model.class}Presenter".constantize
    presenter = klass.new(model, self)

    yield(presenter) if block_given?
  end
end
