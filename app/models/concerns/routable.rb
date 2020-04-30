# frozen_string_literal: true

# These methods are usually provided by ActiveRecord
# and help link_to to understand where to go. Since they
# are not provided by ContentfulModel::Base, we add them here
module Routable
  include ActiveSupport::Concern

  def to_model
    id
  end

  def model_name
    self.class
  end

  def persisted?
    false
  end

  def to_param
    id
  end

  def self.route_key
    self.class.underscore.pluralize
  end
end
