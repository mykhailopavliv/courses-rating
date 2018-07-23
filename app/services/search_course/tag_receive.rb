module SearchCourse
  class TagReceive
    def initialize(params)
      @params = params
    end

    %i[city_id organization_id title].each do |method_name|
      define_method method_name do
        params[method_name]
      end
    end

    def tag_list
      if tags.try(:last).present?
        tags
      else
        Course.all_tags.map(&:name)
      end
    end

    private

    attr_reader :params

    def tags
      @tags = params[:tag_list]
    end
  end
end
