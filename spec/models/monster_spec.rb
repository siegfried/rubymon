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

  describe '#weakness' do
    subject { instance.weakness }
    let(:instance) { create :monster, category: category }

    context 'when category is fire' do
      let(:category) { 'fire' }

      it { should eq 'water' }
    end

    context 'when category is water' do
      let(:category) { 'water' }

      it { should eq 'earth' }
    end

    context 'when category is earth' do
      let(:category) { 'earth' }

      it { should eq 'electric' }
    end

    context 'when category is electric' do
      let(:category) { 'electric' }

      it { should eq 'wind' }
    end

    context 'when category is wind' do
      let(:category) { 'wind' }

      it { should eq 'fire' }
    end
  end
end
