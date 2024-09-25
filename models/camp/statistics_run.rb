class StatisticsRun
  PATH = 'saves/statistics_run.yml'

  def initialize(type)
    create()
    @data = YAML.safe_load_file(PATH)
  end

  private

  def create
    File.write(PATH, new_file_data().to_yaml) unless RubyVersionFixHelper.file_exists?(PATH) # File::exists?(PATH)
  end

  def update
    File.write(PATH, @data.to_yaml)
  end

  def new_file_data
    {
      'bandits' => {
        'rabble' => 0,
        'rabid_dog' => 0,
        'poacher' => 0,
        'thug' => 0,
        'deserter' => 0,
        'bandit_leader' => 0
      },
      'undeads' => {
        'zombie' => 0,
        'skeleton' => 0,
        'ghost' => 0,
        'fat_ghoul' => 0,
        'skeleton_soldier' => 0,
        'zombie_knight' => 0
      },
      'swamp' => {
        'leech' => 0,
        'goblin' => 0,
        'sworm' => 0,
        'spider' => 0,
        'orc' => 0,
        'ancient_snail' => 0
      }
    }
  end
end
