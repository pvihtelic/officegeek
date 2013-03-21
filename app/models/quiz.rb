  class Quiz < ActiveRecord::Base
  attr_accessible :quiz_path, :user_id, :tutorial_id, :blank_quiz_id, :title, :status

  
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
    :s3_permissions => :private,
    :path => "quizzes/:attachment/:filename",
    :url => "quizzes/:attachment/:filename",
  	:storage => :s3,
    :s3_credentials => {
      :access_key_id => ENV["AWS_ACCESS_KEY_ID"],
      :bucket => ENV["S3_BUCKET_NAME"],
      :secret_access_key => ENV["AWS_SECRET_ACCESS_KEY"]
    }

end
