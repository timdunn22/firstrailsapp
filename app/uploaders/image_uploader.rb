class ImageUploader < AvatarUploader


  version :post do
    process resize_to_fill: [70, 70]
  end


end
