if Rails.env.production?
  Refile.backends['store'] = Refile::Backend::FileSystem.new('/home/ec2-user/CreatorsItem/shared/uploads')
end