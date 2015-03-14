guard 'foodcritic', :cli => '--epic-fail any', cookbook_paths: '.' do
  watch(%r{.*\.rb})
  watch(%r{.*\.erb})
end

guard 'rspec', cmd: 'bundle exec rspec' do
  watch(%r{^spec/.+})
  watch(%r{^recipes/(.+)\.rb$})
  watch(%r{^attributes/(.+)\.rb$})
  watch(%r{^files/(.+)})
  watch(%r{^templates/(.+)})
  watch(%r{^providers/(.+)\.rb})
  watch(%r{^resources/(.+)\.rb})
end
