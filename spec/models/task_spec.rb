require 'rails_helper'

RSpec.describe Task, type: :model do
  # As a programmer, I can create a new Task record with a title and description.
  it "should be a task" do
    expect{Task.new}.to_not raise_error
  end
# As a programmer, I can list all Task records.
  it "should have a title and description" do
    task = Task.new
    task.title = "Dishes"
    task.description = "Run dishwasher"
    expect(task.save).to be true
    t1 = Task.find_by_title("Dishes")
    expect(t1.title).to eq "Dishes"
    expect(t1.description).to eq "Run dishwasher"
  end

  it "should list all tasks" do
    task = Task.new
    task.title = "Dust"
    task.description = "Dust pictures in bedroom"
    expect(task.save).to be true
    t1 = Task.find_by_title("Dust")
    expect(t1.title).to eq "Dust"
    expect(t1.description).to eq "Dust pictures in bedroom"
    task2 = Task.new
    task2.title = "Dishes"
    task2.description = "Run dishwasher"
    expect(task2.save).to be true
    t2 = Task.find_by_title("Dishes")
    expect(t2.title).to eq "Dishes"
    expect(t2.description).to eq "Run dishwasher"
  end
# As a programmer, I can set a Task record to done given the ID of the record.
  it "should list all tasks, if they are done or not" do
    task = Task.new
    task.title = "Dust"
    task.description = "Dust pictures in bedroom"
    task.done = true
    expect(task.save).to be true
    t1 = Task.find_by_title("Dust")
    expect(t1.title).to eq "Dust"
    expect(t1.description).to eq "Dust pictures in bedroom"
    expect(t1.done).to be true
    task2 = Task.new
    task2.title = "Dishes"
    task2.description = "Run dishwasher"
    task2.done = false
    expect(task2.save).to be true
    t2 = Task.find_by_title("Dishes")
    expect(t2.title).to eq "Dishes"
    expect(t2.description).to eq "Run dishwasher"
    expect(t2.done).to be false
  end

  it "should like the task, and show the description, if it is done and the due date" do
    task = Task.new
    task.title = "Dust"
    task.description = "Dust pictures in bedroom"
    task.done = true
    task.due_date = "2016-09-02"
    expect(task.save).to be true
    t1 = Task.find_by_title("Dust") 
    expect(t1.title).to eq "Dust"
    expect(t1.description).to eq "Dust pictures in bedroom"
    expect(t1.done).to be true
    expect(t1.due_date).to eq "2016-09-02"
  end

end
