RSpec.describe Task, type: :model do
  it 'タスクとその詳細を登録することができる。' do
    task = Task.new(name: 'test task', detail: 'これはテスト用のタスクです。')
    expect(task).to be_valid
  end

  it 'タスク登録時、タスク名が指定されないと登録することができない。' do
    task = Task.new(name: nil, detail: 'バリデーションテスト')
    task.valid?
    expect(task.errors[:name]).to include("can't be blank")
  end

  it 'タスク詳細は空白でも登録することができる。' do
    task = Task.new(name: 'test task', detail: nil)
    expect(task).to be_valid
  end
end
