require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  #check if 
  describe "Get Index" do
    it "renders the root path  template" do
      expect(get: root_url(subdomain: nil)).to route_to(
        controller: "home",
        action: "index")
    end

    it "renders the :index template" do
      expect(get: '/').to route_to(
        controller: "home",
        action: "index")
    end 
  end

  describe 'post calculate' do 
    it 'renders sindex template' do 
      post 'calculate', input: '5*3+1+6/2+9*100'
      expect(response).to render_template(:index)
    end

    it 'assigns @result to caliculated value' do 

      post 'calculate', input: '5*3+1+6/2+9*100'
      expect(assigns(:result)).not_to be_nil
      expect(assigns(:result)).to eq(919)
    end

    it 'gives invalid input if input is incorrect' do 
      post 'calculate', input: ''
      expect(assigns(:result)).to eq('Invalid input')
    end
  end
end
