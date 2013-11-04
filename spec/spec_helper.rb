$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'csvkit2'

require 'csv'
require 'tmpdir'
require 'shellwords'

module SpecHelper
  def run(*args)
    out_path = File.join(Dir.tmpdir, "#{args.join('_').gsub(/\W/, '_')}-#{Time.now.to_f}.csv")
    bin_path = File.expand_path("../../bin/#{args.shift}", __FILE__)
    in_paths = args.map { |path| File.expand_path("../support/#{path}", __FILE__) }
    cmd = "bash -c 'bundle exec #{bin_path} #{in_paths.map { |path| Shellwords.escape(path) }.join(' ')}' > #{out_path}"
    stdout = `#{cmd}`
    unless $?.success?
      $stderr.puts "boom: #{cmd}"
      $stderr.puts stdout
    end
    out_path
  end

  def assert_csv(got_csv_path, expected_csv)
    got = CSV.read(got_csv_path, headers: true).to_s
    expected = CSV.parse(expected_csv.gsub(/^ */, '').strip, headers: true).to_s
    got.should == expected
  end
end
