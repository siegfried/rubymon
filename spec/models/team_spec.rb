require 'rails_helper'

RSpec.describe Team, type: :model do
  describe '#valid?' do
    subject { instance.valid? }
    let(:instance) { build :team, user: user }
    let(:user) { create :user }

    it { should be true }

    context 'when there are 3 teams of the user' do
      before { create_list :team, 3, user: user }

      it { should be false }
    end
  end
end
