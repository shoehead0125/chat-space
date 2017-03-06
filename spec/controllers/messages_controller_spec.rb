require 'rails_helper'

describe MessagesController do
  login_user
  let(:group) { create(:group) }
  let(:invalid_attributes){FactoryGirl.attributes_for(:message, body: nil)}

  it "shold have a current_user"  do
    expect(subject.current_user).to_not eq(nil)
  end

  describe 'GET #index' do
    it "assigns the requested contact @message" do
      get :index, params: { group_id: group.id }
      expect(assigns(:message)).to be_a_new(Message)
    end

    it "assigns the requested contact @group" do
      get :index, params: { group_id: group.id }
      expect(assigns(:group)).to eq group
    end

    it "assigns the requested contact @messages" do
      @group = create(:group, :with_messages)
      get :index, params: { group_id: @group.id }
      expect(assigns(:messages)).to match(@group.messages)
    end

    it "assigns the reqested contact @groups" do
      get :index, params: { group_id: group.id }
      expect(assigns(:groups)).to eq subject.current_user.groups
    end

    it "renders the :index template" do
      get :index, params: {group_id: group.id}
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    it "saves the new contact in the database" do
      expect{
        post :create, {group_id: group.id, message: attributes_for(:message)}}.to change(Message, :count).by(1)
    end

    example ": create successful to render the :index template" do
      post :create, {group_id: group.id, message: attributes_for(:message)}
      expect(response).to redirect_to(group_id: group.id)
    end

    example ": create unsuccessful to render the same template" do
      post :create, {group_id: group.id, message: invalid_attributes}
      expect(response).to render_template :index, params: { group_id: group.id}
    end
  end


end
