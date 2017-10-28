class Fixture
  def self.load_json(path)
    fpath = Pathname.new(__dir__).join('fixture', path + '.json')
    File.open(fpath, 'r').read
  end

  def self.load(path)
    JSON.parse(load_json(path), symbolize_names: true)
  end
end
