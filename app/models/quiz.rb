class Quiz < ActiveRecord::Base
  attr_accessible :quiz_path, :user_id

  belongs_to :user
  has_attached_file :quiz_path,
    :url => "/system/:hash.:extension",
    :hash_secret => "longSecretString",
  	:storage => :s3,
    :s3_credentials => {
      :access_key_id => ENV["AWS_ACCESS_KEY_ID"],
      :bucket => ENV["S3_BUCKET_NAME"],
      :secret_access_key => ENV["AWS_SECRET_ACCESS_KEY"]
    }

end
