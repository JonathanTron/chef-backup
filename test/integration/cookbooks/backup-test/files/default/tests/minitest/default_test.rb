require File.expand_path('../support/helpers', __FILE__)

describe 'backup::default' do

  include Helpers::Backup

  it "installs omnibus-backup" do
    package("omnibus-backup").must_be_installed
  end

  it "creates Backup's directory" do
    directory("/opt/backup").must_exist
  end

  ["keys", "models", "logs"].each do |dir|
    it "creates Backup's #{dir} directory" do
      directory("/opt/backup/#{dir}").must_exist
    end
  end

  describe "Backup's config file" do
    let(:config) { file "/opt/backup/config.rb" }

    it "exists" do
      config.must_exist
    end

    it "contains gpg utilities config" do
      config.must_include 'gpg = "/opt/omnibus-backup/embedded/bin/gpg2"'
    end

    it "contains openssl utilities config" do
      config.must_include 'openssl = "/opt/omnibus-backup/embedded/bin/openssl"'
    end

  end

end
