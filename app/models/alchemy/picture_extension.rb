Alchemy::Picture.class_eval do
  # Enables Dragonfly image processing
  dragonfly_accessor :image_file, app: :alchemy_pictures do
    # Preprocess after uploading the picture
    after_assign do |p|
      resize = Alchemy::Config.get(:preprocess_image_resize)
      p.thumb!(resize) if resize.present?
      p.process!(:optimize)
      p.convert!('-strip -interlace Plane') if p.mime_type.match /image\/jpeg/
    end
  end
end
