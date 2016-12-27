module ModelMirror
  # Get datas for views
  class MirrorController < ApplicationController
    before_filter do
      Rails.application.eager_load! if Rails.env.development?
    end

    def index
      @models = ActiveRecord::Base.descendants
    end

    def show
      @row = model_instance
      @has_manies = model_instance.send(params[:has_many]) if model_has_many
    end

    def list
      @rows = model_class.all
    end

    private

    def model_has_many
      model_class.reflect_on_association(params[:has_many])
    end

    def model_class
      params[:model_path].classify.constantize
    end
    helper_method :model_class

    def model_instance
      @model_instance ||= model_class.find(params[:id])
    end

    def has_many_relations(model_class)
      model_class.reflections.select do |_, relation|
        relation.is_a? ActiveRecord::Reflection::HasManyReflection or
          relation.is_a? ActiveRecord::Reflection::ThroughReflection
      end
    end
    helper_method :has_many_relations

    def belongs_to_relations(model_class)
      model_class.reflections.select do |_, relation|
        relation.is_a? ActiveRecord::Reflection::BelongsToReflection or
          relation.is_a? ActiveRecord::Reflection::HasOneReflection
      end
    end
    helper_method :belongs_to_relations
  end
end
