class BasePresenter < SimpleDelegator
  attr_reader :model, :view_context
  alias __getobj__ model

  def initialize(model, view_context)
    @model        = model
    @view_context = view_context
  end

  def inspect
    "#<#{self.class} model: #{model.inspect}>"
  end

  def self.presents(model)
    protected
    define_method(model) do
      @model
    end
  end

  protected

  def h
    @view_context
  end
end
