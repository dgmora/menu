# frozen_string_literal: true

class Recipe < ContentfulModel::Base
  include Routable

  self.content_type_id = name.underscore

  coerce_field calories: :Integer
  coerce_field description: :Text
  coerce_field title: :String
end
