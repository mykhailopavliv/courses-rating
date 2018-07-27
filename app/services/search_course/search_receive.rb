module SearchCourse
  class SearchReceive
    class << self
      def search_by_title(courses, title)
        title.present? ? courses.where('title ILIKE ?', "%#{title}%") : courses
      end

      def search_by_city_id(courses, city_id)
        city_id.present? ? courses.where('city_id::text LIKE ?', "%#{city_id}%") : courses
      end

      def search_by_org_id(courses, org_id)
        org_id.present? ? courses.where('organization_id::text LIKE ?', "%#{org_id}%") : courses
      end

      def search_by_tag_list(courses, tag_list)
        return courses.tagged_with(tag_list, any: true, wild: true) if tag_list.try(:last).present?
        courses
      end
    end
  end
end
