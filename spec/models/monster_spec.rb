require 'rails_helper'

RSpec.describe Monster, type: :model do
  describe '#valid?' do
    subject { instance.valid? }
    let(:user) { create :user }
    let(:instance) { build :monster, user: user }

    it { should be true }

    context 'when there are 20 monsters of the user' do
      before { create_list :monster, 20, user: user }

      it { should be false }
    end
  end
end
