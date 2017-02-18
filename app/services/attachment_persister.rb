module AttachmentPersister
  BUCKET = ENV['AWS_ATTACHMENTS_S3_BUCKET']

  class << self
    def bucket
      @bucket ||= Aws::S3::Resource.new.bucket(BUCKET)
    end

    def object(key)
      bucket.object(key)
    end

    def persist(key, body)
      bucket.put_object(
        acl: 'public-read',
        key: key,
        body: body
      )
    end

    def destroy(key)
      bucket.delete_objects(
        delete: {
          objects: [{
            key: key
          }]
        }
      )
    end
  end
end
