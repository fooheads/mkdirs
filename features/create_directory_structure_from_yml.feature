Feature: Create directory structure from yml
  As a person treating my computers as cattle
  I want to easily re-create my project directory structure
  So that I don't waste time (and get bored)

  Scenario: Create directories from yaml
    When I choose to apply the config
      """
      code: 
        project1: 
          subproj-a:
          subproj-b:
        project2: 
            subproj-1:
      """
    Then the following directory structure should be created
      """
      code
      code/project1
      code/project1/subproj-a
      code/project1/subproj-b
      code/project2
      code/project2/subproj-1
      """

  Scenario: Run commands associated with each leaf
    When I choose to apply the config
      """
      code:
        mkdirs: git clone ../../../../../mkdirs
        coolproj:
      """
    Then the following directory structure should be created
      """
      code
      code/coolproj
      code/mkdirs
      code/mkdirs/bin
      code/mkdirs/bin/console
      code/mkdirs/bin/setup
      code/mkdirs/exe
      code/mkdirs/exe/mkdirs
      code/mkdirs/features
      code/mkdirs/features/create_directory_structure_from_yml.feature
      code/mkdirs/features/step_definitions
      code/mkdirs/features/step_definitions/mkdirs_steps.rb
      code/mkdirs/features/support
      code/mkdirs/features/support/env.rb
      code/mkdirs/Gemfile
      code/mkdirs/lib
      code/mkdirs/lib/mkdirs
      code/mkdirs/lib/mkdirs/version.rb
      code/mkdirs/lib/mkdirs.rb
      code/mkdirs/LICENSE.txt
      code/mkdirs/mkdirs.gemspec
      code/mkdirs/Rakefile
      code/mkdirs/README.md
      """
