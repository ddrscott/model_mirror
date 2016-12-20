Rails.application.routes.draw do

  mount ModelMirror::Engine => "/mirror"
end
