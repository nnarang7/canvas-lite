class Submission < ActiveRecord::Base
   mount_uploader :attachment, AttachmentUploader
   validates :name, presence: true
   validates :name, length: { minimum: 2 }
   validates :attachment, presence: true
end
