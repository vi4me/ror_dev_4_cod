require "cloudinary"
require "shrine/storage/cloudinary"

Cloudinary.config(
  cloud_name: "dlxfc1wlp",
  api_key:    "884144822268459",
  api_secret: "6NgwvZji7v_lxiL54tmy5PnrpRs",
)

Shrine.storages = {
  cache: Shrine::Storage::Cloudinary.new(prefix: "test/cache"), # for direct uploads
  store: Shrine::Storage::Cloudinary.new(prefix: "test"),
}

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data
Shrine.plugin :restore_cached_data
Shrine.plugin :validation_helpers
Shrine.plugin :validation
