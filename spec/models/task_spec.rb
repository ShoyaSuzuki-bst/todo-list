RSpec.describe Task, type: :model do
  describe 'name' do
    let(:task) { FactoryBot.build(:task, name: name) }

    context 'when valid' do # name when valid （名前が有効なとき）
      let(:name) { 'test task' }

      it { expect(task).to be_valid }
    end

    context 'when invalid' do # name when invalid （名前が無効なとき）
      let!(:name) { nil }

      # it { expect(task).to be_invalid }
      it 'expect has errors' do
        task.valid?
        expect(task.errors.messages[:name]).to include("can't be blank")
      end
    end
  end
end
