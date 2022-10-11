class Contact::Import < ApplicationRecord
    belongs_to :user
  
    has_one_attached :import_file
  
    after_create :enqueue_processing
  
    enum status: %i[created processing done]
  
    def raw_file
      @raw_file ||= import_file.attachment.download
    end
  
    def reader
      VcardReader.new(raw_file)
    end
  
    def enqueue_processing
      ProcessContactImportJob.perform_later id
    end
  
    def parse_vcard_to_contacts
      reader.each do |contact_data, (avatar_path, filename)|
        contact = Contact.new(contact_data.merge(user_id: user_id))
  
        if avatar_path
          contact.avatar.attach(io: File.open(avatar_path), filename: filename)
        end
  
        if contact.save
          p contact.id
        else
          p contact.errors
        end
      end
    end
  end