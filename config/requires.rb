Dir[File.expand_path('app/**/*.rb', __FILE__)].each do |f|
  require f
end

Dir[File.expand_path('models/*.rb', __FILE__)].each do |f|
  require f
end

Dir[File.expand_path('fixtures/*.rb', __FILE__)].each do |f|
  require f
end