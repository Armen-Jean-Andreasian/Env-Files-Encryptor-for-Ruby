# frozen_string_literal: true

require_relative 'env_retriever'

# Testing with json, yaml and csv files
module Test
  ENV_FILES = %w[file.json file.yaml file.csv].freeze
  MASTER_KEY_PATH = 'config/master.key'

  def self.encrypt_files(delete_original: true)
    ENV_FILES.each do |file|
      Encryptor.encrypt(filepath: file, key: File.read(MASTER_KEY_PATH).strip)
      delete_file(filepath: file) if delete_original
    end
  end

  def self.decrypt_files(delete_original: true)
    ENV_FILES.each do |file|
      Encryptor.decrypt(filepath: file, key: File.read(MASTER_KEY_PATH).strip)
      delete_file(filepath: "#{file}.enc") if delete_original
    end
  end

  def self.delete_file(filepath:)
    File.delete(filepath)
  end
end

# ruby -r './test.rb' -e 'Test.encrypt_files'
# ruby -r './test.rb' -e 'Test.decrypt_files'
