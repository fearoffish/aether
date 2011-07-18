group 'backend' do
  guard 'bundler' do
    watch('Gemfile')
  end

  guard 'rspec', :cli => '--color --format doc' do
    # Regexp watch patterns are matched with Regexp#match
    watch(%r{^spec/.+_spec\.rb})
    watch(%r{^lib/(.+)\.rb})         { |m| "spec/lib/#{m[1]}_spec.rb" }
    watch(%r{^spec/models/.+\.rb})   { ["spec/models", "spec/acceptance"] }
    watch(%r{^spec/.+\.rb})          { `say hello` }

    # String watch patterns are matched with simple '=='
    watch('spec/spec_helper.rb') { "spec" }
  end
end

group 'frontend' do
  guard 'coffeescript', :output => 'public/javascripts/compiled' do
    watch(%r{^app/coffeescripts/.+\.coffee})
  end

  guard 'livereload' do
    watch(%r{^app/.+\.(erb|haml)})
  end
end
