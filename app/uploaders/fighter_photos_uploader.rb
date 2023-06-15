class FighterPhotosUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def fog_directory
    'gotham-pictures'
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
