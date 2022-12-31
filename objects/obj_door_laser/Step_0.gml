if health_ = 500
image_index = 0

if health_ > 400 && health_ < 500
image_index = 1

if health_ > 300 && health_ < 399
image_index = 2

if health_ > 200 && health_ < 299
image_index = 3

if health_ > 100 && health_ < 199
image_index = 4

if health_ <= 0 
instance_destroy()