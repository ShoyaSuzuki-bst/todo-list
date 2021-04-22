RSpec.describe Task, type: :model do
  describe 'name' do
    let(:task) { FactoryBot.build(:task) }
    let(:blank_name) { FactoryBot.build(:task, :blank_name) }
    let(:overflow_name) { FactoryBot.build(:task, :overflow_name) }
    let(:overflow_detail) { FactoryBot.build(:task, :overflow_detail) }

    context 'when task is valid' do
      it { expect(task).to be_valid }
    end

    context 'when name is null' do
      it "is expected to return error [タスク名を入力してください]" do
        blank_name.valid?
        expect(blank_name.errors[:name]).to include("を入力してください")
      end
    end

    context 'when name is overflow' do
      it 'is expected to return error [タスク名は25文字以内で入力してください]' do
        overflow_name.valid?
        expect(overflow_name.errors[:name]).to include('は25文字以内で入力してください')
      end
    end

    context 'when detail is overflow' do
      it 'is expected to return error [タスク詳細sは660文字以内で入力してください' do
        overflow_detail.valid?
        expect(overflow_detail.errors[:detail]).to include('は660文字以内で入力してください')
      end
    end
  end
end
