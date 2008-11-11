Gem::Specification.new do |s|
  s.name              = 'integrity'
  s.version           = '0.1.0'
  s.date              = '2008-11-10'
  s.summary           = 'The easy and fun Continuous Integration server'
  s.description       = 'Your Friendly Continuous Integration server. Easy, fun and painless!'
  s.homepage          = 'http://integrityapp.com'
  s.rubyforge_project = 'integrity'
  s.email             = 'contacto@nicolassanguinetti.info'
  s.authors           = ['Nicolás Sanguinetti', 'Simon Rozet']
  s.has_rdoc          = false
  s.files             = %w(
                          README.markdown
                          Rakefile
                          app.rb
                          config.ru
                          config/config.sample.yml
                          config/thin.sample.yml
                          integrity.gemspec
                          lib/integrity.rb
                          lib/integrity/build.rb
                          lib/integrity/builder.rb
                          lib/integrity/core_ext/object.rb
                          lib/integrity/core_ext/string.rb
                          lib/integrity/core_ext/time.rb
                          lib/integrity/notifier.rb
                          lib/integrity/notifier/base.rb
                          lib/integrity/notifier/email.haml
                          lib/integrity/notifier/email.rb
                          lib/integrity/notifier/jabber.haml
                          lib/integrity/notifier/jabber.rb
                          lib/integrity/project.rb
                          lib/integrity/scm.rb
                          lib/integrity/scm/git.rb
                          lib/integrity/scm/git/uri.rb
                          lib/integrity/version.rb
                          public/buttons.css
                          public/reset.css
                          public/spinner.gif
                          vendor/sinatra-hacks/lib/hacks.rb
                          views/build.haml
                          views/build_info.haml
                          views/home.haml
                          views/integrity.sass
                          views/layout.haml
                          views/new.haml
                          views/not_found.haml
                          views/notifier.haml
                          views/project.haml
                          views/unauthorized.haml
                        )

  s.add_dependency 'sinatra', ['>= 0.3.2']
  s.add_dependency 'dm-core', ['>= 0.9.5']
  s.add_dependency 'dm-validations', ['>= 0.9.5']
  s.add_dependency 'dm-types', ['>= 0.9.5']
  s.add_dependency 'dm-timestamps', ['>= 0.9.5']
  s.add_dependency 'dm-aggregates', ['>= 0.9.5']
  s.add_dependency 'data_objects', ['>= 0.9.5']
  s.add_dependency 'do_sqlite3', ['>= 0.9.5']        
  s.add_dependency 'json'
  s.add_dependency 'foca-sinatra-diddies', ['>= 0.0.2']
end
