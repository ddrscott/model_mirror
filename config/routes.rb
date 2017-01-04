ModelMirror::Engine.routes.draw do

  root 'mirror#index'

  get '*model_path/:id/:relation', to: 'mirror#show', constraints: { id: /(\d+)|([0-9a-f]{8}-([0-9a-f]{4}-){3}[0-9a-f]{12})/ }, as: 'mirror_relation'
  get '*model_path/:id', to: 'mirror#show', constraints: { id: /(\d+)|([0-9a-f]{8}-([0-9a-f]{4}-){3}[0-9a-f]{12})/ }, as: 'mirror_show'
  get '*model_path', to: 'mirror#list', as: 'mirror_list'
end
