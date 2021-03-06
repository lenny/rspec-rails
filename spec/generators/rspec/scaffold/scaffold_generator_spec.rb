require 'spec_helper'

# Generators are not automatically loaded by Rails
require 'generators/rspec/scaffold/scaffold_generator'

describe Rspec::Generators::ScaffoldGenerator do
  # Tell the generator where to put its output (what it thinks of as Rails.root)
  destination File.expand_path("../../../../../tmp", __FILE__)

  before { prepare_destination }

  describe 'controller specs' do
    subject { file('spec/controllers/posts_controller_spec.rb') }
    describe 'generated by default' do
      before do
        run_generator %w(posts)
      end

      describe 'the spec' do
        it { should exist }
        it { should contain /require 'spec_helper'/ }
        it { should contain /describe PostsController/ }
      end
    end
    describe 'skipped with a flag' do
      before do
        run_generator %w(posts --no-controller_specs)
      end
      it { should_not exist }
    end
  end

  describe 'view specs' do
    describe 'generated by default' do
      before do
        run_generator %w(posts)
      end
      describe 'edit' do
        subject { file("spec/views/posts/edit.html.erb_spec.rb") }
        it { should exist }
        it { should contain /require 'spec_helper'/ }
        it { should contain /describe "(.*)\/edit.html.erb"/ }
        it { should contain /it "renders the edit (.*) form"/ }
      end
      describe 'index' do
        subject { file("spec/views/posts/index.html.erb_spec.rb") }
        it { should exist }
        it { should contain /require 'spec_helper'/ }
        it { should contain /describe "(.*)\/index.html.erb"/ }
        it { should contain /it "renders a list of (.*)"/ }
      end
      describe 'new' do
        subject { file("spec/views/posts/new.html.erb_spec.rb") }
        it { should exist }
        it { should contain /require 'spec_helper'/ }
        it { should contain /describe "(.*)\/new.html.erb"/ }
        it { should contain /it "renders new (.*) form"/ }
      end
      describe 'show' do
        subject { file("spec/views/posts/show.html.erb_spec.rb") }
        it { should exist }
        it { should contain /require 'spec_helper'/ }
        it { should contain /describe "(.*)\/show.html.erb"/ }
        it { should contain /it "renders attributes in <p>"/ }
      end
    end

    describe 'skipped with a flag' do
      before do
        run_generator %w(posts --no-view-specs)
      end
      describe 'edit' do
        subject { file("spec/views/posts/edit.html.erb_spec.rb") }
        it { should_not exist }
      end
      describe 'index' do
        subject { file("spec/views/posts/index.html.erb_spec.rb") }
        it { should_not exist }
      end
      describe 'new' do
        subject { file("spec/views/posts/new.html.erb_spec.rb") }
        it { should_not exist }
      end
      describe 'show' do
        subject { file("spec/views/posts/show.html.erb_spec.rb") }
        it { should_not exist }
      end
    end
  end

  describe 'routing specs' do
    subject { file('spec/routing/posts_routing_spec.rb') }
    describe 'generated by default' do
      before do
        run_generator %w(posts)
      end

      describe 'the spec' do
        it { should exist }
        it { should contain /require "spec_helper"/ }
        it { should contain /describe PostsController/ }
        it { should contain /describe "routing"/ }
      end
    end
    describe 'skipped with a flag' do
      before do
        run_generator %w(posts --no-routing_specs)
      end
      it { should_not exist }
    end
  end

end
