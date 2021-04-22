RSpec.describe Task, type: :model do
  describe 'name' do
    let(:fillname) { FactoryBot.build(:task) }
    let(:blankname) { FactoryBot.build(:blankname) }

    context 'when valid' do # name when valid （名前が有効なとき）
      it { expect(fillname).to be_valid }
    end

    context 'when invalid' do # name when invalid （名前が無効なとき）
      it { expect(blankname).to be_invalid }
    end
  end
end
