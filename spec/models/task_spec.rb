RSpec.describe Task, type: :model do
  describe 'name' do
    let(:fillname) { FactoryBot.build(:task) }
    let(:blank_name) { FactoryBot.build(:blank_name) }
    let(:overflow_name) { FactoryBot.build(:overflow_name) }
    let(:overflow_detail) { FactoryBot.build(:overflow_detail) }

    context 'when valid' do # name when valid （名前が有効なとき）
      it { expect(fillname).to be_valid }
    end

    context 'when name is null' do # name when invalid （名前が無効なとき）
      it "is expected to return error [Name can't be blank]" do
        blank_name.valid?
        expect(blank_name.errors[:name]).to include("can't be blank")
      end
    end

    context 'when name is overflow' do
      it 'is expected to return error [Name is too long (maximum is 25 characters)]' do
        overflow_name.valid?
        expect(overflow_name.errors[:name]).to include('is too long (maximum is 25 characters)')
      end
    end

    context 'when detail is overflow' do
      it 'is expected to return error [Detail is too long (maximum is 660 characters)]' do
        overflow_detail.valid?
        expect(overflow_detail.errors[:detail]).to include('is too long (maximum is 660 characters)')
      end
    end
  end
end
