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
      @model_children = model_children
    end

    def list
      @rows = model_class.all
    end

    private

    def model_children
      return unless model_association
      # ensure an Array is returned in cases
      # of belongs_to/has_one associations
      Array model_instance.send(params[:relation])
    end

    def model_association
      model_class.reflect_on_association(params[:relation])
    end

    def model_class
      params[:model_path].classify.constantize
    end
    helper_method :model_class

    def model_instance
      @model_instance ||= model_class.find(params[:id])
    end
  end
end
