require_relative '../spec_helper'

describe 'Basecamp Importer' do

  let(:client) {Basecamp.establish_connection!(BASECAMP_URL,
    BASECAMP_TOKEN,
    'X',
    true);
   
   Basecamp
  }
  let(:project) { client::Project.first }

  describe Basecamp do
    use_vcr_cassette 'basecamp'

    it 'should be able to fetch projects' do
      res = client::Project.all
      res.each do |proj|
        proj.should respond_to :id
      end
    end

  end

  describe Basecamp::Project do
    use_vcr_cassette 'basecamp'

    it 'should be able to fetch its messages' do
      project.messages.each do |msg|
        msg.should respond_to :id
      end
    end

    it 'should be able to fetch its milestones' do
      project.milestones.each do |ms|
        ms.project_id.should == project.id
      end
    end

    it 'should be able to fetch its todo lists' do
      project.todos.each do |list|
        list.should respond_to :items
      end
    end

  end

  describe Basecamp::Message do
    use_vcr_cassette 'basecamp'

    it 'should be able to find its comments' do
      project.messages.each do |msg|
        if msg.comments_count > 0
          msg.should respond_to :comments
        end
      end
    end
    
    it 'should know its attachments' do
      project.messages.each do |msg|
        if msg.attachments_count > 0
          msg.should respond_to :attachments
          msg.attachments.length.should == msg.attachments_count
        end
      end
    end

    it 'should be able to get the download link for an attachment' do
      project.messages.each do |msg|
        if msg.attachments_count > 0 
          attachment = msg.attachments.first
          attachment.should respond_to :download_url
          attachment.owner_id.should == msg.id
        end
      end
    end

    it 'should be able to get its file' do
      project.messages.each do |msg|
        if msg.attachments_count > 0
          attachment = msg.attachments.first
          file = attachment.download_file
          File.exists?("/tmp/#{attachment.name}").should == true
          File.delete "/tmp/#{attachment.name}"
        end
      end
    end
  end

  describe Basecamp::TodoList do
    use_vcr_cassette 'basecamp'

    it 'should be be able to fetch its items' do
      project.todos.each do |list|
        list.should respond_to :items
      end
    end
  end

end
