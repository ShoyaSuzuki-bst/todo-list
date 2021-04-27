require 'rails_helper'

RSpec.describe "Tasks", type: :system do
  before { driven_by(:rack_test) }

  describe '/tasks/index' do

    # create_atが異なる4つのタスクを作成
    (0..3).each do |i|
      FactoryBot.create(:task, name: 'test', limited_at: Time.current + i.days, created_at: Time.current + i.days)
    end
    context 'access /tasks/index' do
      let(:valid_datetimes) { Task.order(created_at: :desc).pluck(:created_at).map{ |created_at| I18n.l(created_at, format: :short) } }
      it 'is expected to sort tasks descending order of created_at' do
        visit tasks_path

        # 表示されている内容から、全タスクの作成日時(create_at)を取得する。
        # allメソッドは上から順番に格納するはずなので、正常に動作しているならばこの時点で「作成日の新しい順」になっている。
        # string array
        created_datetimes = all('div.task-row div.task-created_at').map{ |i| i.text }
        # 「作成日の新しい順」となっているはずのdateと、DBから参照したデータをソートしたもので比較する。
        expect(created_datetimes).to eq(valid_datetimes)
      end
    end

    context 'access /tasks/index' do
      let(:valid_datetimes) { Task.order(:limited_at).pluck(:limited_at).map{ |created_at| I18n.l(created_at, format: :short) } }
      it 'is expected to sort tasks descending order of limited_at' do
        visit "/tasks/sort/limited_at"
        display_limited_datetimes = all('div.task-row div.task-created_at').map{ |i| i.text }
        expect(display_limited_datetimes).to eq(valid_datetimes)
      end
    end
  end
end
