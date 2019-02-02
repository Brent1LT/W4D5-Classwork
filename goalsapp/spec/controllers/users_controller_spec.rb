require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  
  describe 'GET#index' do 
    it 'displays all users' do 
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET#new' do 
    it 'displays create form' do 
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'GET#show' do 
    it 'displays a single user' do 
      get :show, params: { id: User.last.id }
      expect(response).to render_template(:show)
    end
  end

  describe 'GET#edit' do 
    it 'displays update form' do 
      get :edit, params: {id: User.last.id } 
      expect(response).to render_template(:edit)
    end
  end


end
