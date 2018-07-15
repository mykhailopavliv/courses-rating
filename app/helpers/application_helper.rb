module ApplicationHelper
  def present(model)
    return if model.blank?

    klass     = "#{model.class}Presenter".constantize
    presenter = klass.new(model, self)

    yield(presenter) if block_given?
    presenter
  end
end
