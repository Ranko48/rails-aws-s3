class FighterPhotosUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :bust do
    process :crop_bust
  end

  def crop_bust
    manipulate! do |img|
      height = img.rows
      new_height = (height * 0.3).round
      img.crop!(0, 0, img.columns, new_height)
      img
    end
  end

  def extension_allowlist
    %w(png)
  end
end
