# frozen_string_literal: true

class Chef < ContentfulModel::Base
  self.content_type_id = name.underscore
  coerce_field name: :String
end
