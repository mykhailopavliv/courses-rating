module Omniauth
  class Receive
    def initialize(params)
      @params = params
    end

    # def uid; def provider;
    %i[uid provider].each do |method_name|
      define_method method_name do
        params[method_name]
      end
    end

    def email
      info[:email]
    end

    def first_name
      info[:first_name]
    end

    def last_name
      info[:last_name]
    end

    def url
      info[:urls].try(:Facebook)
    end

    protected

    attr_reader :params

    def info
      @info ||= params.fetch(:info, {})
    end
  end
end
