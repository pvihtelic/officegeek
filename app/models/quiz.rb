class Quiz < ActiveRecord::Base
attr_accessible :quiz_path, :user_id, :tutorial_id, :blank_quiz_id, :title, :status, :question_1, :question_2, :question_3, :question_4, :question_5

require 'roo'
require 'open-uri'
require 'iconv'

Spreadsheet.client_encoding = 'UTF-8'

after_create :grade_skill_assessment
validates :title, :presence => {:message => 'Please select the Skill Assessment Topic.'}
validates_presence_of :title

validates_presence_of :quiz_path
validates_attachment_size :quiz_path, :less_than => 50.kilobytes    
validates_attachment_presence :quiz_path 
validates_attachment_content_type :quiz_path, 
                                :content_type => ["application/pdf","application/vnd.ms-excel",     
         "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"],
                                :message => 'We only accept Microsoft Excel files ending in .xlsx or .xls'

belongs_to :user
belongs_to :tutorial
belongs_to :blank_quiz
has_attached_file :quiz_path,
  :storage => :s3,
  :path => "quizzes/:attachment/:filename",
  :url => "quizzes/:attachment/:filename",
  :storage => :s3,
  :s3_credentials => {
    :access_key_id => ENV["AWS_ACCESS_KEY_ID"],
    :bucket => ENV["S3_BUCKET_NAME"],
    :secret_access_key => ENV["AWS_SECRET_ACCESS_KEY"]
  }

  def grade_skill_assessment
    if self.title.include? 'Getting'
      file = Roo::Excelx.new("#{self.quiz_path.queued_for_write[:original].path}")
      file.default_sheet = file.sheets.first
      
      if !self.quiz_path_file_name.nil?
        if self.quiz_path_file_name.include? 'v2'
          self.update_attribute(:question_1, 1)
        else
          self.update_attribute(:question_1, 0)
        end
      else
        self.update_attribute(:question_1, 0)  
      end

      if !file.sheets[0].nil?
        if file.sheets[0].to_s.include? 'Assessment'
          self.update_attribute(:question_2, 1)
        else 
          self.update_attribute(:question_2, 0)
        end
      else
        self.update_attribute(:question_2, 0)
      end

      if !file.cell('B',15).nil?
        if file.cell('B',15).to_s.include? 'Copy'
          self.update_attribute(:question_3, 1)
        else 
          self.update_attribute(:question_3, 0)
        end
      else
        self.update_attribute(:question_3, 0)
      end

      if !file.sheets[1].nil?
        if file.sheets[1].to_s.include? 'New'
          self.update_attribute(:question_4, 1)
        else 
          self.update_attribute(:question_4, 0)
        end
      else
        self.update_attribute(:question_4, 0)
      end

      if !file.font('A',23).nil? 
        if file.font('A',23).bold? && file.font('A',23).underline?
          self.update_attribute(:question_5, 1)
        else 
          self.update_attribute(:question_5, 0)
        end
      else
        self.update_attribute(:question_5, 0)
      end

      
      score_array = []
      score_array << self.question_1.to_i
      score_array << self.question_2.to_i
      score_array << self.question_3.to_i
      score_array << self.question_4.to_i
      score_array << self.question_5.to_i

      if score_array.inject{|sum,x| sum + x } == 5
        self.update_attribute(:status, 3)
      else
        self.update_attribute(:status, 2)
      end

    
    ##### SKILL ASSESSMENT 2 #####

    elsif self.title.include? 'Worksheet'
      file = Roo::Excelx.new("#{self.quiz_path.queued_for_write[:original].path}")
      if file.sheets[0].to_s.include?('Grossing')
          file.default_sheet = file.sheets[0]
      elsif !file.sheets[1].nil?
          file.default_sheet = file.sheets[0]
      else
      end

      if !file.cell('A',5).nil?
        if file.cell('A',5).to_s.include?('Rank')
          self.update_attribute(:question_1, 1)
        else 
          self.update_attribute(:question_1, 0)
        end
      else
        self.update_attribute(:question_1, 0)
      end

      if !file.cell('B',5).nil? && !file.cell('B',8).nil?
        if file.cell('B',5).to_s.include?('Title') && file.cell('B',8).to_s.include?('Avenger')
          self.update_attribute(:question_2, 1)
        else 
          self.update_attribute(:question_2, 0)
        end
      else
        self.update_attribute(:question_2, 0)
      end

      if !file.cell('A',5).nil? && !file.cell('A',8).nil?
        if file.cell('A',5).to_s.include?('Rank') && file.cell('A',8).to_s.include?('3')
          self.update_attribute(:question_3, 1)
        else 
          self.update_attribute(:question_3, 0)
        end
      else
        self.update_attribute(:question_3, 0)
      end

      if !file.cell('B',10).nil? && !file.cell('A',15).nil?
        if file.cell('B',10).to_s.include?('Transformer') && file.cell('A',15).to_s.include?('10')
          self.update_attribute(:question_4, 1)
        else 
          self.update_attribute(:question_4, 0)
        end
      else
        self.update_attribute(:question_4, 0)
      end

      if !file.cell('C',5).nil? && !file.cell('C',15).nil?
        if file.cell('C',5).to_s.include?('gross') && file.excelx_value('C',15).to_s.include?('171')
          self.update_attribute(:question_5, 1)
        else 
          self.update_attribute(:question_5, 0)
        end
      else
        self.update_attribute(:question_5, 0)
      end

      score_array = []
      score_array << self.question_1.to_i
      score_array << self.question_2.to_i
      score_array << self.question_3.to_i
      score_array << self.question_4.to_i
      score_array << self.question_5.to_i

      if score_array.inject{|sum,x| sum + x } == 5
        self.update_attribute(:status, 3)
      else
        self.update_attribute(:status, 2)
      end

    ##### SKILL ASSESSMENT 3 #####

    elsif self.title.include? 'Formula'
      file = Roo::Excelx.new("#{self.quiz_path.queued_for_write[:original].path}")
      file = Roo::Excelx.new("#{self.quiz_path.queued_for_write[:original].path}")
      file.default_sheet = file.sheets.first
      
      if !file.cell('B',16).nil?
        if file.formula('B',16).to_s.include?('+') && file.excelx_value('B',16).to_s.include?('398')
          self.update_attribute(:question_1, 1)
        else 
          self.update_attribute(:question_1, 0)
        end
      else
        self.update_attribute(:question_1, 0)
      end

      if !file.cell('B',26).nil?
        if file.formula('B',26).to_s.include?('*') && file.excelx_value('B',26).to_s.include?('10')
          self.update_attribute(:question_2, 1)
        else 
          self.update_attribute(:question_2, 0)
        end
      else
        self.update_attribute(:question_2, 0)
      end

      if !file.cell('D',34).nil? && !file.cell('D',35).nil? && !file.cell('D',36).nil? && !file.cell('D',37).nil?
        if file.formula('D',34).to_s.include?('COUNT') && file.excelx_value('D',34).to_s.include?('9') && file.formula('D',35).to_s.include?('SUM') && file.excelx_value('D',35).to_s.include?('841') && file.formula('D',36).to_s.include?('AVERAGE') && file.excelx_value('D',36).to_s.include?('93') && file.formula('D',37).to_s.include?('MEDIAN') && file.excelx_value('D',37).to_s.include?('64');
          self.update_attribute(:question_3, 1)
        else 
          self.update_attribute(:question_3, 0)
        end
      else
        self.update_attribute(:question_3, 0)
      end

      if !file.cell('B',48).nil?
        if file.formula('B',48).to_s.include?('IF') && file.formula('B',48).to_s.include?('A33')
          self.update_attribute(:question_4, 1)
        else 
          self.update_attribute(:question_4, 0)
        end
      else
        self.update_attribute(:question_4, 0)
      end

      if !file.cell('B',55).nil?
        if file.formula('B',55).to_s.include?('IF') && file.formula('B',55).to_s.include?('250') && file.excelx_value('B',55).to_s.include?('BUY')
          self.update_attribute(:question_5, 1)
        else 
          self.update_attribute(:question_5, 0)
        end
      else
        self.update_attribute(:question_5, 0)
      end



      score_array = []
      score_array << self.question_1.to_i
      score_array << self.question_2.to_i
      score_array << self.question_3.to_i
      score_array << self.question_4.to_i
      score_array << self.question_5.to_i

      if score_array.inject{|sum,x| sum + x } == 5
        self.update_attribute(:status, 3)
      else
        self.update_attribute(:status, 2)
      end

    end  
  
  
  
  end


end
