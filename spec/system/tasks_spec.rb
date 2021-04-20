require 'rails_helper'

RSpec.describe "Tasks", type: :system do
  before { driven_by(:rack_test) }

  describe '/tasks/index' do
    [*0..3].each do |i|
      FactoryBot.create(:task, name: 'test2', created_at: Time.current + i.days)
    end
    context 'access /tasks/index' do
      it 'is expected tasks list desc' do
        visit tasks_path
        date = all('div.task-row div.task-created_at').map{ |i| i.text.in_time_zone }
        expect(date).to eq(date.sort.reverse)
      end
    end
  end
end
