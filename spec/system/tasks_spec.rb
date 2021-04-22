require 'rails_helper'

RSpec.describe "Tasks", type: :system do
  before { driven_by(:rack_test) }

  describe '/tasks/index' do

    # create_atが異なる4つのタスクを作成
    (0..3).each do |i|
      FactoryBot.create(:task, name: 'test', created_at: Time.current + i.days)
    end
    let(:valid_datetimes) { Task.order(created_at: :desc).pluck(:created_at).map{ |i| Time.at(i.to_i / 60 * 60) } }
    context 'access /tasks/index' do
      it 'is expected tasks list desc' do
        visit tasks_path

        # 表示されている内容から、全タスクの作成日時(create_at)を取得する。
        # allメソッドは上から順番に格納するはずなので、正常に動作しているならばこの時点で「作成日の新しい順」になっている。
        # string array
        created_datetimes = all('div.task-row div.task-created_at').map{ |i| i.text.in_time_zone }
        # 「作成日の新しい順」となっているはずのdateと、それを後からソートしたもので比較する。
        expect(created_datetimes).to eq(valid_datetimes)
      end
    end
  end
end
