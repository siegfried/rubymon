require 'rails_helper'

RSpec.describe TeamsController, :type => :controller do

  before { sign_in user }

  let!(:user) { team.user }
  let!(:team) { create :team }
  let(:teams_params) { {} }
  let(:team_params) { teams_params.merge(id: team.to_param) }

  let(:valid_attributes)    { attributes_for :team }
  let(:invalid_attributes)  { { name: '' } }

  describe "#index" do
    before { get :index, teams_params }

    specify { expect(assigns(:teams)).to eq([team]) }
    it { should render_template :index }
  end

  describe "#show" do
    before { get :show, team_params }

    specify { expect(assigns(:team)).to eq(team) }
    it { should render_template :show }
  end

  describe "#new" do
    before { get :new, teams_params }

    specify { expect(assigns(:team)).to be_a_new(Team) }
    it { should render_template :new }
  end

  describe "#edit" do
    before { get :edit, team_params }

    specify { expect(assigns(:team)).to eq(team) }
    it { should render_template :edit }
  end

  describe "#create" do
    before { post :create, params } 

    context "with valid params" do
      let(:params) { teams_params.merge(team: valid_attributes) }

      specify { expect(assigns(:team)).to be_persisted }
      it { should redirect_to Team.last }
    end

    context "with invalid params" do
      let(:params) { teams_params.merge(team: invalid_attributes) }

      specify { expect(assigns(:team)).not_to be_persisted }
      specify { expect(assigns(:team)).not_to be_valid }
      it { should render_template :new }
    end
  end

  describe "#update" do
    before { patch :update, params }

    context "with valid params" do
      let(:params) { team_params.merge(team: valid_attributes) }

      specify { expect(assigns(:team)).to eq(team) }
      specify { expect(assigns(:team)).to be_persisted }
      it { should redirect_to team }
    end

    context "with invalid params" do
      let(:params) { team_params.merge(team: invalid_attributes) }

      specify { expect(assigns(:team)).to eq(team) }
      specify { expect(assigns(:team)).not_to be_valid }
      it { should render_template :edit }
    end
  end

  describe "#destroy" do
    before { delete :destroy, team_params }

    specify { expect(assigns(:team)).to eq(team) }
    specify { expect(assigns(:team)).to be_destroyed }
    it { should redirect_to(teams_url) }
  end

end
