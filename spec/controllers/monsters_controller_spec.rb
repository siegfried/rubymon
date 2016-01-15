require 'rails_helper'

RSpec.describe MonstersController, :type => :controller do

  before { sign_in user }

  let!(:user) { monster.user }
  let!(:monster) { create :monster }
  let(:monsters_params) { {} }
  let(:monster_params) { monsters_params.merge(id: monster.to_param) }

  let(:valid_attributes)    { attributes_for :monster }
  let(:invalid_attributes)  { { category: '' } }

  describe "#index" do
    before { get :index, monsters_params }

    specify { expect(assigns(:monsters)).to eq([monster]) }
    it { should render_template :index }
  end

  describe "#show" do
    before { get :show, monster_params }

    specify { expect(assigns(:monster)).to eq(monster) }
    it { should render_template :show }
  end

  describe "#new" do
    before { get :new, monsters_params }

    specify { expect(assigns(:monster)).to be_a_new(Monster) }
    it { should render_template :new }
  end

  describe "#edit" do
    before { get :edit, monster_params }

    specify { expect(assigns(:monster)).to eq(monster) }
    it { should render_template :edit }
  end

  describe "#create" do
    before { post :create, params } 

    context "with valid params" do
      let(:params) { monsters_params.merge(monster: valid_attributes) }

      specify { expect(assigns(:monster)).to be_persisted }
      it { should redirect_to Monster.last }
    end

    context "with invalid params" do
      let(:params) { monsters_params.merge(monster: invalid_attributes) }

      specify { expect(assigns(:monster)).not_to be_persisted }
      specify { expect(assigns(:monster)).not_to be_valid }
      it { should render_template :new }
    end
  end

  describe "#update" do
    before { patch :update, params }

    context "with valid params" do
      let(:params) { monster_params.merge(monster: valid_attributes) }

      specify { expect(assigns(:monster)).to eq(monster) }
      specify { expect(assigns(:monster)).to be_persisted }
      it { should redirect_to monster }
    end

    context "with invalid params" do
      let(:params) { monster_params.merge(monster: invalid_attributes) }

      specify { expect(assigns(:monster)).to eq(monster) }
      specify { expect(assigns(:monster)).not_to be_valid }
      it { should render_template :edit }
    end
  end

  describe "#destroy" do
    before { delete :destroy, monster_params }

    specify { expect(assigns(:monster)).to eq(monster) }
    specify { expect(assigns(:monster)).to be_destroyed }
    it { should redirect_to(monsters_url) }
  end

end
